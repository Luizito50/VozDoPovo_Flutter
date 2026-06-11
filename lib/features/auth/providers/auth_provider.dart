import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
Stream<User?> authState(AuthStateRef ref) {
  return FirebaseAuth.instance.authStateChanges();
}

@riverpod
Future<void> signInAnonymously(SignInAnonymouslyRef ref) async {
  final auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    await auth.signInAnonymously();
  }
}

@riverpod
User? currentUser(CurrentUserRef ref) {
  return ref.watch(authStateProvider).valueOrNull;
}
