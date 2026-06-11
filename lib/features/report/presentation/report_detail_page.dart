import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:latlong2/latlong.dart';

import '../domain/report.dart';
import '../providers/feed_provider.dart';
import '../../../shared/widgets/map_view.dart';

class ReportDetailPage extends ConsumerWidget {
  final String reportId;
  const ReportDetailPage({super.key, required this.reportId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportDetailProvider(reportId));
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Denúncia')),
      body: reportAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erro: $e')),
        data: (report) {
          if (report == null) {
            return const Center(child: Text('Denúncia não encontrada.'));
          }
          return _DetailContent(report: report);
        },
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  final Report report;
  const _DetailContent({required this.report});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto
          CachedNetworkImage(
            imageUrl: report.photoUrl,
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Badge categoria + status
                Row(
                  children: [
                    _CategoryBadge(category: report.category),
                    const SizedBox(width: 8),
                    _StatusBadge(status: report.status),
                    const Spacer(),
                    Text(
                      timeago.format(report.createdAt, locale: 'pt_BR'),
                      style: TextStyle(color: cs.onSurfaceVariant, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Descrição
                Text(
                  report.description,
                  style: const TextStyle(fontSize: 16, height: 1.6),
                ),
                const SizedBox(height: 20),

                // Endereço
                if (report.address != null) ...[
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 18, color: cs.primary),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          report.address!,
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                // Mini-mapa
                const Text(
                  'Localização',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: SizedBox(
                    height: 180,
                    child: MapView(
                      reports: [report],
                      initialCenter: report.location,
                      interactive: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  final ReportCategory category;
  const _CategoryBadge({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '${category.emoji} ${category.label}',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final ReportStatus status;
  const _StatusBadge({required this.status});

  Color get _color => switch (status) {
        ReportStatus.pending => Colors.orange,
        ReportStatus.inReview => Colors.blue,
        ReportStatus.resolved => Colors.green,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color.withOpacity(0.4)),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          color: _color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
