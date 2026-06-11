import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPicker extends StatefulWidget {
  final LatLng initialLocation;
  final void Function(LatLng) onLocationChanged;

  const MapPicker({
    super.key,
    required this.initialLocation,
    required this.onLocationChanged,
  });

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  late LatLng _location;
  late final MapController _mapCtrl;

  @override
  void initState() {
    super.initState();
    _location = widget.initialLocation;
    _mapCtrl = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FlutterMap(
          mapController: _mapCtrl,
          options: MapOptions(
            initialCenter: _location,
            initialZoom: 16,
            onTap: (_, point) {
              setState(() => _location = point);
              widget.onLocationChanged(point);
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.seunome.vozdopovo',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: _location,
                  width: 48,
                  height: 56,
                  alignment: Alignment.topCenter,
                  child: const _DraggablePin(),
                ),
              ],
            ),
          ],
        ),

        // Botão de centralizar no GPS
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton.small(
            heroTag: 'center_gps',
            onPressed: () {
              _mapCtrl.move(_location, 17);
            },
            child: const Icon(Icons.my_location_rounded),
          ),
        ),
      ],
    );
  }
}

class _DraggablePin extends StatelessWidget {
  const _DraggablePin();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: cs.primary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: cs.primary.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(Icons.location_on, color: Colors.white, size: 20),
        ),
        Container(
          width: 2,
          height: 16,
          color: cs.primary,
        ),
      ],
    );
  }
}
