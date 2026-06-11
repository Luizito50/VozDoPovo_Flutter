import 'package:latlong2/latlong.dart';

/// Implementação simples de Geohash para queries de proximidade no Firestore.
/// Precision 9 ≈ ±2.4m — suficiente para denúncias urbanas.
class GeohashUtil {
  static const _base32 = '0123456789bcdefghjkmnpqrstuvwxyz';

  static String encode(LatLng point, {int precision = 9}) {
    double minLat = -90, maxLat = 90;
    double minLng = -180, maxLng = 180;
    final hash = StringBuffer();
    int bits = 0, bitsTotal = 0, hashValue = 0;
    bool isEven = true;

    while (hash.length < precision) {
      double mid;
      if (isEven) {
        mid = (minLng + maxLng) / 2;
        if (point.longitude > mid) {
          hashValue = (hashValue << 1) + 1;
          minLng = mid;
        } else {
          hashValue = hashValue << 1;
          maxLng = mid;
        }
      } else {
        mid = (minLat + maxLat) / 2;
        if (point.latitude > mid) {
          hashValue = (hashValue << 1) + 1;
          minLat = mid;
        } else {
          hashValue = hashValue << 1;
          maxLat = mid;
        }
      }
      isEven = !isEven;
      bits++;
      if (bits == 5) {
        hash.write(_base32[hashValue]);
        bits = 0;
        hashValue = 0;
      }
      bitsTotal++;
    }
    return hash.toString();
  }

  /// Retorna os prefixos de geohash vizinhos para query de proximidade.
  static List<String> neighborsForRadius(LatLng center, double radiusKm) {
    final precision = radiusKm < 0.1 ? 9 : radiusKm < 1 ? 7 : radiusKm < 10 ? 5 : 4;
    final centerHash = encode(center, precision: precision);
    // Retorna o hash central + prefixo para query de range
    return [centerHash];
  }
}
