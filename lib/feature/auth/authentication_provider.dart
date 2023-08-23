import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationNotifier extends StateNotifier<AuthState> {
  AuthenticationNotifier() : super(AuthState());
}

class AuthState {}
