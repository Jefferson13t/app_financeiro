import 'dart:developer';

import 'package:app_financeiro/common/models/user_model.dart';
import 'package:app_financeiro/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(
        id: email.hashCode,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw "Senha insegura. Digite uma senha forte";
      }
      throw "Nao foi possivel criar sua conta neste momento. Tente mais tarde";
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
      );
    } catch (e) {
      if (password.startsWith('123')) {
        throw "Senha insegura. Digite uma senha forte";
      }
      throw "Nao foi possivel criar sua conta neste momento. Tente mais tarde";
    }
  }

  @override
  Future<void> signOut() async {
    try {
      log("User logs out");
    } catch (e) {
      rethrow;
    }
  }
}
