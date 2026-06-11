import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/report/domain/report.dart';
import '../../../features/report/providers/feed_provider.dart';
import '../../../shared/widgets/report_card.dart';
import '../../../shared/widgets/map_view.dart';
import '../../../features/auth/providers/auth_provider.dart';

class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({super.key});

  @override
  ConsumerState<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 2, vsync: this);
    // Garante auth anônima
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(signInAnonymouslyProvider);
    });
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedAsync = ref.watch(feedStreamProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        backgroundColor: cs.surface,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_city_rounded, color: cs.primary, size: 22),
            const SizedBox(width: 8),
            Text(
              'VozDoPovo',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: cs.primary,
                fontSize: 20,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabs,
          tabs: const [
            Tab(icon: Icon(Icons.list_alt_rounded), text: 'Lista'),
            Tab(icon: Icon(Icons.map_outlined), text: 'Mapa'),
          ],
        ),
      ),
      body: feedAsync.when(
        loading: () => const _LoadingSkeleton(),
        error: (e, _) => _ErrorView(message: e.toString()),
        data: (reports) => TabBarView(
          controller: _tabs,
          children: [
            _ListView(reports: reports),
            MapView(reports: reports),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/report/new'),
        icon: const Icon(Icons.add_a_photo_rounded),
        label: const Text('Nova Denúncia'),
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final List<Report> reports;
  const _ListView({required this.reports});

  @override
  Widget build(BuildContext context) {
    if (reports.isEmpty) {
      return const _EmptyState();
    }
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      itemCount: reports.length,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: ReportCard(report: reports[i]),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.sentiment_satisfied_alt_rounded,
              size: 72, color: cs.primary.withOpacity(0.3)),
          const SizedBox(height: 16),
          Text(
            'Nenhuma denúncia ainda!',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: cs.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'Seja o primeiro a registrar um problema\nna sua cidade.',
            textAlign: TextAlign.center,
            style: TextStyle(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _LoadingSkeleton extends StatelessWidget {
  const _LoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 48, color: Colors.red),
            const SizedBox(height: 12),
            Text('Erro ao carregar: $message', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
