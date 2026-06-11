import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../domain/report.dart';
import '../../../shared/services/image_compress_service.dart';
import '../../../shared/utils/geohash_util.dart';

part 'report_repository.g.dart';

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) {
  return ReportRepository();
}

class ReportRepository {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  CollectionReference get _col => _db.collection('reports');

  /// Cria uma nova denúncia:
  /// 1. Comprime a foto
  /// 2. Faz upload para o Firebase Storage
  /// 3. Salva o documento no Firestore
  Future<String> createReport({
    required String userId,
    required ReportCategory category,
    required String description,
    required File photoFile,
    required LatLng location,
    String? deviceId,
    String? address,
  }) async {
    final reportId = const Uuid().v4();

    // 1. Comprime foto
    final compressed = await ImageCompressService.compress(photoFile);

    // 2. Upload Storage
    final ref = _storage.ref('reports/$reportId/photo.jpg');
    await ref.putFile(
      compressed,
      SettableMetadata(contentType: 'image/jpeg'),
    );
    final photoUrl = await ref.getDownloadURL();

    // 3. Geohash
    final geohash = GeohashUtil.encode(location);

    // 4. DeviceHash (anti-trote, nunca exposto)
    final deviceHash = deviceId != null
        ? sha256.convert(utf8.encode(deviceId)).toString()
        : null;

    // 5. Salva no Firestore
    final report = Report(
      id: reportId,
      userId: userId,
      category: category,
      description: description,
      photoUrl: photoUrl,
      location: location,
      geohash: geohash,
      createdAt: DateTime.now(),
      deviceHash: deviceHash,
      address: address,
    );

    await _col.doc(reportId).set(report.toFirestore());
    return reportId;
  }

  /// Feed: denúncias mais recentes paginadas.
  Stream<List<Report>> feedStream({
    int limit = 20,
    DocumentSnapshot? startAfter,
  }) {
    Query query = _col
        .orderBy('createdAt', descending: true)
        .limit(limit);
    if (startAfter != null) query = query.startAfterDocument(startAfter);
    return query.snapshots().map(
          (snap) => snap.docs.map(Report.fromFirestore).toList(),
        );
  }

  /// Denúncias próximas a um ponto (raio em km).
  Stream<List<Report>> nearbyStream(LatLng center, {double radiusKm = 2}) {
    final geohash = GeohashUtil.encode(center, precision: 5);
    return _col
        .where('geohash', isGreaterThanOrEqualTo: geohash)
        .where('geohash', isLessThan: '${geohash}~')
        .orderBy('geohash')
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots()
        .map((s) => s.docs.map(Report.fromFirestore).toList());
  }

  /// Busca uma denúncia por ID.
  Future<Report?> getById(String id) async {
    final doc = await _col.doc(id).get();
    if (!doc.exists) return null;
    return Report.fromFirestore(doc);
  }
}
