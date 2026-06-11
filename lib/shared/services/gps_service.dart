import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class GpsService {
  /// Retorna a posição atual do GPS.
  /// Solicita permissão se necessário.
  static Future<LatLng> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationServiceDisabledException();
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const PermissionDeniedException('Permissão de localização negada.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw const PermissionDeniedException(
          'Permissão negada permanentemente. Abra as configurações.');
    }

    // CORREÇÃO AQUI: Removido o 'locationSettings' que quebrava no v12
    // Passamos a precisão diretamente usando o parâmetro correto 'desiredAccuracy'
    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
      timeLimit: const Duration(seconds: 10),
    );

    return LatLng(pos.latitude, pos.longitude);
  }

  /// Calcula distância em metros entre dois pontos.
  static double distanceMeters(LatLng a, LatLng b) {
    return Geolocator.distanceBetween(
      a.latitude, a.longitude,
      b.latitude, b.longitude,
    );
  }
}