import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../domain/report.dart';
import '../providers/report_notifier.dart';
import '../../../shared/services/gps_service.dart';
import '../../../shared/widgets/map_picker.dart';
import '../../../shared/widgets/category_selector.dart';

class ReportFormPage extends ConsumerStatefulWidget {
  const ReportFormPage({super.key});

  @override
  ConsumerState<ReportFormPage> createState() => _ReportFormPageState();
}

class _ReportFormPageState extends ConsumerState<ReportFormPage> {
  final _picker = ImagePicker();
  final _descController = TextEditingController();
  int _step = 0; // 0=foto, 1=local, 2=detalhes

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  // ── Passo 0: Captura de foto ─────────────────────────────────────────────

  Future<void> _pickImage(ImageSource source) async {
    final xfile = await _picker.pickImage(source: source, imageQuality: 95);
    if (xfile == null) return;
    ref.read(reportFormNotifierProvider.notifier).setPhoto(File(xfile.path));
    _getLocationAndAdvance();
  }

  Future<void> _getLocationAndAdvance() async {
    setState(() => _step = 1);
    try {
      final pos = await GpsService.getCurrentPosition();
      ref.read(reportFormNotifierProvider.notifier).setLocation(pos);
    } catch (e) {
      // GPS falhou: usuário vai ajustar manualmente no mapa
    }
  }

  // ── Submit ────────────────────────────────────────────────────────────────

  Future<void> _submit() async {
    final notifier = ref.read(reportFormNotifierProvider.notifier);
    final id = await notifier.submit();
    if (!mounted) return;
    if (id != null) {
      notifier.reset();
      context.go('/report/success');
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportFormNotifierProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_stepTitle()),
        leading: _step == 0
            ? CloseButton(onPressed: () => context.pop())
            : BackButton(onPressed: () => setState(() => _step--)),
      ),
      body: Column(
        children: [
          // Barra de progresso
          LinearProgressIndicator(
            value: (_step + 1) / 3,
            backgroundColor: cs.surfaceContainerHighest,
            color: cs.primary,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: switch (_step) {
                0 => _StepPhoto(onPickImage: _pickImage),
                1 => _StepLocation(
                    initialLocation: state.location,
                    onConfirm: (loc, addr) {
                      ref
                          .read(reportFormNotifierProvider.notifier)
                          .setLocation(loc, address: addr);
                      setState(() => _step = 2);
                    },
                  ),
                _ => _StepDetails(
                    state: state,
                    descController: _descController,
                    onSubmit: _submit,
                  ),
              },
            ),
          ),
        ],
      ),
    );
  }

  String _stepTitle() => switch (_step) {
        0 => 'Tire uma foto',
        1 => 'Confirme o local',
        _ => 'Detalhes da denúncia',
      };
}

// ── Passo 0: Foto ────────────────────────────────────────────────────────────

class _StepPhoto extends StatelessWidget {
  final void Function(ImageSource) onPickImage;
  const _StepPhoto({required this.onPickImage});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add_a_photo_rounded,
                size: 64, color: cs.primary),
          ),
          const SizedBox(height: 32),
          Text(
            'Registre o problema',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            'Tire uma foto ou escolha da galeria\npara documentar o problema.',
            textAlign: TextAlign.center,
            style: TextStyle(color: cs.onSurfaceVariant, height: 1.5),
          ),
          const SizedBox(height: 40),
          FilledButton.icon(
            onPressed: () => onPickImage(ImageSource.camera),
            icon: const Icon(Icons.camera_alt_rounded),
            label: const Text('Abrir câmera'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => onPickImage(ImageSource.gallery),
            icon: const Icon(Icons.photo_library_outlined),
            label: const Text('Escolher da galeria'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 52),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Passo 1: Local ────────────────────────────────────────────────────────────

class _StepLocation extends StatefulWidget {
  final LatLng? initialLocation;
  final void Function(LatLng, String?) onConfirm;
  const _StepLocation({this.initialLocation, required this.onConfirm});

  @override
  State<_StepLocation> createState() => _StepLocationState();
}

class _StepLocationState extends State<_StepLocation> {
  LatLng? _location;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _location = widget.initialLocation;
    if (_location != null) setState(() => _loading = false);
    else _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    try {
      final pos = await GpsService.getCurrentPosition();
      if (mounted) setState(() { _location = pos; _loading = false; });
    } catch (e) {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Obtendo localização GPS…'),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: MapPicker(
            initialLocation: _location ?? const LatLng(-15.793889, -47.882778),
            onLocationChanged: (loc) => setState(() => _location = loc),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Arraste o marcador para ajustar a posição exata.',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: _location == null
                      ? null
                      : () => widget.onConfirm(_location!, null),
                  icon: const Icon(Icons.check_rounded),
                  label: const Text('Confirmar local'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Passo 2: Detalhes ────────────────────────────────────────────────────────

class _StepDetails extends StatelessWidget {
  final ReportFormState state;
  final TextEditingController descController;
  final VoidCallback onSubmit;

  const _StepDetails({
    required this.state,
    required this.descController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Consumer(
        builder: (context, ref, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Miniatura da foto
              if (state.photo != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.file(
                    state.photo!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 20),

              // Categoria
              Text('Categoria',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              CategorySelector(
                selected: state.category,
                onSelected: (cat) =>
                    ref.read(reportFormNotifierProvider.notifier).setCategory(cat),
              ),
              const SizedBox(height: 20),

              // Descrição
              Text('Descrição',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              TextField(
                controller: descController,
                maxLines: 3,
                maxLength: 280,
                onChanged: (v) =>
                    ref.read(reportFormNotifierProvider.notifier).setDescription(v),
                decoration: const InputDecoration(
                  hintText: 'Descreva o problema brevemente…',
                ),
              ),
              const SizedBox(height: 8),

              // Erro
              if (state.errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(child: Text(state.errorMessage!,
                          style: const TextStyle(color: Colors.red))),
                    ],
                  ),
                ),

              const SizedBox(height: 20),

              FilledButton.icon(
                onPressed: state.isLoading ? null : onSubmit,
                icon: state.isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.send_rounded),
                label: Text(state.isLoading ? 'Publicando…' : 'Publicar denúncia'),
              ),
            ],
          );
        },
      ),
    );
  }
}
