import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportSuccessPage extends StatefulWidget {
  const ReportSuccessPage({super.key});

  @override
  State<ReportSuccessPage> createState() => _ReportSuccessPageState();
}

class _ReportSuccessPageState extends State<ReportSuccessPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _scale = CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut);
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeIn);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _scale,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 72,
                    color: Colors.green.shade600,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeTransition(
                opacity: _opacity,
                child: Column(
                  children: [
                    Text(
                      'Denúncia publicada!',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: cs.onSurface,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Sua denúncia foi registrada com\ncoordenadas GPS e já está visível\npara toda a comunidade.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: cs.onSurfaceVariant,
                          fontSize: 16,
                          height: 1.6),
                    ),
                    const SizedBox(height: 40),
                    FilledButton.icon(
                      onPressed: () => context.go('/'),
                      icon: const Icon(Icons.home_rounded),
                      label: const Text('Voltar ao início'),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => context.go('/report/new'),
                      child: const Text('Registrar outra denúncia'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
