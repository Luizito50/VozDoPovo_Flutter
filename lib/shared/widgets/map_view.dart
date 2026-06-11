import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';

import '../../features/report/domain/report.dart';

class MapView extends StatelessWidget {
  final List<Report> reports;
  final LatLng? initialCenter;
  final bool interactive;

  const MapView({
    super.key,
    required this.reports,
    this.initialCenter,
    this.interactive = true,
  });

  @override
  Widget build(BuildContext context) {
    final center = initialCenter ??
        (reports.isNotEmpty
            ? reports.first.location
            : const LatLng(-15.793889, -47.882778));

    return FlutterMap(
      options: MapOptions(
        initialCenter: center,
        initialZoom: 14,
        interactionOptions: InteractionOptions(
          flags: interactive
              ? InteractiveFlag.all
              : InteractiveFlag.none,
        ),
      ),
      children: [
        // Tiles OpenStreetMap (gratuito)
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.seunome.vozdopovo',
          maxZoom: 19,
        ),

        // Markers clusterizados
        MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 60,
            size: const Size(40, 40),
            markers: reports
                .map((r) => Marker(
                      point: r.location,
                      width: 40,
                      height: 40,
                      child: GestureDetector(
                        onTap: () => context.push('/report/${r.id}'),
                        child: _ReportMarker(category: r.category),
                      ),
                    ))
                .toList(),
            builder: (context, markers) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Center(
                child: Text(
                  '${markers.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReportMarker extends StatelessWidget {
  final ReportCategory category;
  const _ReportMarker({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(category.emoji, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
