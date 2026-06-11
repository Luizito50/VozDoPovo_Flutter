import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/providers/auth_provider.dart';
import '../features/feed/presentation/feed_page.dart';
import '../features/report/presentation/report_form_page.dart';
import '../features/report/presentation/report_detail_page.dart';
import '../features/report/presentation/report_success_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      if (!isLoggedIn && state.matchedLocation != '/') return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const FeedPage(),
      ),
      GoRoute(
        path: '/report/new',
        builder: (_, __) => const ReportFormPage(),
      ),
      GoRoute(
        path: '/report/:id',
        builder: (_, state) => ReportDetailPage(reportId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/report/success',
        builder: (_, __) => const ReportSuccessPage(),
      ),
    ],
  );
}
