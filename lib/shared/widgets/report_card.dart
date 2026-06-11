import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../features/report/domain/report.dart';

class ReportCard extends StatelessWidget {
  final Report report;
  const ReportCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push('/report/${report.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: report.photoUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  height: 160,
                  color: Colors.grey.shade200,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (_, __, ___) => Container(
                  height: 160,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image_rounded, size: 40),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categoria + tempo
                  Row(
                    children: [
                      Text(
                        '${report.category.emoji} ${report.category.label}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        timeago.format(report.createdAt, locale: 'pt_BR'),
                        style: TextStyle(
                            color: cs.onSurfaceVariant, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Descrição
                  Text(
                    report.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, height: 1.4),
                  ),

                  // Endereço
                  if (report.address != null) ...[
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 14, color: cs.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            report.address!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: cs.onSurfaceVariant, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],

                  // Status badge
                  const SizedBox(height: 8),
                  _StatusChip(status: report.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final ReportStatus status;
  const _StatusChip({required this.status});

  Color get _color => switch (status) {
        ReportStatus.pending => Colors.orange,
        ReportStatus.inReview => Colors.blue,
        ReportStatus.resolved => Colors.green,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          color: _color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
