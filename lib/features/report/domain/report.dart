// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:latlong2/latlong.dart';

// part 'report.freezed.dart';
// part 'report.g.dart';

// enum ReportCategory {
//   iluminacao,
//   asfalto,
//   lixo,
//   alagamento,
//   outro;

//   String get label => switch (this) {
//         iluminacao => 'Iluminação',
//         asfalto => 'Asfalto / Buraco',
//         lixo => 'Lixo Acumulado',
//         alagamento => 'Alagamento',
//         outro => 'Outro',
//       };

//   String get emoji => switch (this) {
//         iluminacao => '💡',
//         asfalto => '🚧',
//         lixo => '🗑️',
//         alagamento => '🌊',
//         outro => '📍',
//       };
// }

// enum ReportStatus {
//   pending,
//   inReview,
//   resolved;

//   String get label => switch (this) {
//         pending => 'Aguardando',
//         inReview => 'Em análise',
//         resolved => 'Resolvido',
//       };
// }

// @freezed
// class Report with _$Report {
//   const factory Report({
//     required String id,
//     required String userId,
//     required ReportCategory category,
//     required String description,
//     required String photoUrl,
//     required LatLng location,
//     required String geohash,
//     @Default(ReportStatus.pending) ReportStatus status,
//     required DateTime createdAt,
//     String? deviceHash,
//     String? address,
//   }) = _Report;

//   factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

//   factory Report.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     final geo = data['location'] as GeoPoint;
//     return Report(
//       id: doc.id,
//       userId: data['userId'] as String,
//       category: ReportCategory.values.firstWhere(
//         (e) => e.name == data['category'],
//         orElse: () => ReportCategory.outro,
//       ),
//       description: data['description'] as String,
//       photoUrl: data['photoUrl'] as String,
//       location: LatLng(geo.latitude, geo.longitude),
//       geohash: data['geohash'] as String,
//       status: ReportStatus.values.firstWhere(
//         (e) => e.name == data['status'],
//         orElse: () => ReportStatus.pending,
//       ),
//       createdAt: (data['createdAt'] as Timestamp).toDate(),
//       deviceHash: data['deviceHash'] as String?,
//       address: data['address'] as String?,
//     );
//   }

//   Map<String, dynamic> toFirestore() => {
//         'userId': userId,
//         'category': category.name,
//         'description': description,
//         'photoUrl': photoUrl,
//         'location': GeoPoint(location.latitude, location.longitude),
//         'geohash': geohash,
//         'status': status.name,
//         'createdAt': FieldValue.serverTimestamp(),
//         'deviceHash': deviceHash,
//         'address': address,
//       };
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'report.freezed.dart';
part 'report.g.dart';

enum ReportCategory {
  iluminacao,
  asfalto,
  lixo,
  alagamento,
  outro;

  String get label => switch (this) {
        iluminacao => 'Iluminação',
        asfalto => 'Asfalto / Buraco',
        lixo => 'Lixo Acumulado',
        alagamento => 'Alagamento',
        outro => 'Outro',
      };

  String get emoji => switch (this) {
        iluminacao => '💡',
        asfalto => '🚧',
        lixo => '🗑️',
        alagamento => '🌊',
        outro => '📍',
      };
}

enum ReportStatus {
  pending,
  inReview,
  resolved;

  String get label => switch (this) {
        pending => 'Aguardando',
        inReview => 'Em análise',
        resolved => 'Resolvido',
      };
}

@freezed
class Report with _$Report {
  // O SEGREDO ESTÁ AQUI: Adicionado para permitir métodos como o toFirestore e fromFirestore
  const Report._();

  const factory Report({
    required String id,
    required String userId,
    required ReportCategory category,
    required String description,
    required String photoUrl,
    required LatLng location,
    required String geohash,
    @Default(ReportStatus.pending) ReportStatus status,
    required DateTime createdAt,
    String? deviceHash,
    String? address,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  factory Report.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final geo = data['location'] as GeoPoint;
    return Report(
      id: doc.id,
      userId: data['userId'] as String,
      category: ReportCategory.values.firstWhere(
        (e) => e.name == data['category'],
        orElse: () => ReportCategory.outro,
      ),
      description: data['description'] as String,
      photoUrl: data['photoUrl'] as String,
      location: LatLng(geo.latitude, geo.longitude),
      geohash: data['geohash'] as String,
      status: ReportStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => ReportStatus.pending,
      ),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      deviceHash: data['deviceHash'] as String?,
      address: data['address'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'userId': userId,
        'category': category.name,
        'description': description,
        'photoUrl': photoUrl,
        'location': GeoPoint(location.latitude, location.longitude),
        'geohash': geohash,
        'status': status.name,
        'createdAt': FieldValue.serverTimestamp(),
        'deviceHash': deviceHash,
        'address': address,
      };
}