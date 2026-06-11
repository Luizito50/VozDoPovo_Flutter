import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/report.dart';
import '../data/report_repository.dart';
import '../../auth/providers/auth_provider.dart';

part 'report_notifier.freezed.dart';
part 'report_notifier.g.dart';

@freezed
class ReportFormState with _$ReportFormState {
  const factory ReportFormState({
    File? photo,
    LatLng? location,
    String? address,
    ReportCategory? category,
    @Default('') String description,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _ReportFormState;
}

@riverpod
class ReportFormNotifier extends _$ReportFormNotifier {
  @override
  ReportFormState build() => const ReportFormState();

  void setPhoto(File photo) => state = state.copyWith(photo: photo, errorMessage: null);

  void setLocation(LatLng location, {String? address}) =>
      state = state.copyWith(location: location, address: address, errorMessage: null);

  void setCategory(ReportCategory category) =>
      state = state.copyWith(category: category, errorMessage: null);

  void setDescription(String description) =>
      state = state.copyWith(description: description, errorMessage: null);

  Future<String?> submit() async {
    final s = state;
    if (s.photo == null || s.location == null || s.category == null) {
      state = state.copyWith(errorMessage: 'Preencha todos os campos obrigatórios.');
      return null;
    }
    if (s.description.trim().isEmpty) {
      state = state.copyWith(errorMessage: 'Adicione uma descrição.');
      return null;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final user = ref.read(currentUserProvider);
      if (user == null) throw Exception('Usuário não autenticado.');

      final repo = ref.read(reportRepositoryProvider);
      final id = await repo.createReport(
        userId: user.uid,
        category: s.category!,
        description: s.description.trim(),
        photoFile: s.photo!,
        location: s.location!,
        address: s.address,
      );

      state = state.copyWith(isLoading: false, isSuccess: true);
      return id;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Erro ao publicar: ${e.toString()}',
      );
      return null;
    }
  }

  void reset() => state = const ReportFormState();
}
