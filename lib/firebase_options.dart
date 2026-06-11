// IMPORTANTE: Substitua este arquivo pelo gerado pelo FlutterFire CLI.
// Execute: flutterfire configure
// Documentação: https://firebase.flutter.dev/docs/cli

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) throw UnsupportedError('Web não suportado neste MVP.');
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('Plataforma não suportada.');
    }
  }

  // ── Substitua os valores abaixo pelos do seu projeto Firebase ──
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'SUA_API_KEY_ANDROID',
    appId: 'SEU_APP_ID_ANDROID',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJECT_ID',
    storageBucket: 'SEU_PROJECT_ID.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'SUA_API_KEY_IOS',
    appId: 'SEU_APP_ID_IOS',
    messagingSenderId: 'SEU_SENDER_ID',
    projectId: 'SEU_PROJECT_ID',
    storageBucket: 'SEU_PROJECT_ID.appspot.com',
    iosClientId: 'SEU_IOS_CLIENT_ID',
    iosBundleId: 'com.seunome.cidadealerta',
  );
}
