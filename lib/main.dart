import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Hive.initFlutter();
  // await Hive.openBox('offline_reports');

  runApp(const ProviderScope(child: VozDoPovoApp()));
}

class VozDoPovoApp extends ConsumerWidget {
  const VozDoPovoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'VozDoPovo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
