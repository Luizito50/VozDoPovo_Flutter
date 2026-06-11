import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/report.dart';
import '../data/report_repository.dart';

part 'feed_provider.g.dart';

@riverpod
// Stream<List<Report>> feedStream(FeedStreamRef ref) {
//   final repo = ref.watch(reportRepositoryProvider);
//   return repo.feedStream();
// }

@riverpod
Stream<List<Report>> nearbyStream(NearbyStreamRef ref, LatLng center) {
  final repo = ref.watch(reportRepositoryProvider);
  return repo.nearbyStream(center);
}

@riverpod
Future<Report?> reportDetail(ReportDetailRef ref, String id) async {
  final repo = ref.watch(reportRepositoryProvider);
  return repo.getById(id);
}

Stream<List<Report>> feedStream(FeedStreamRef ref) {
  // Retorna uma lista falsa só para ver se os ReportCards aparecem na tela
  return Stream.value([
    Report(
      id: '1',
      userId: 'user_teste',
      category: ReportCategory.asfalto,
      description: 'Buraco enorme na cratera da avenida principal.',
      photoUrl: 'https://via.placeholder.com/150',
      location: LatLng(-8.76, -63.90),
      geohash: 'abc',
      createdAt: DateTime.now(),
    ),
  ]);
}