import 'package:app_financeiro/features/sign_up/sign_up_state.dart';
import 'package:app_financeiro/services/auth_service.dart';
import 'package:app_financeiro/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;

  SignUpController(
    this._service,
  );

  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    const secureStorage = SecureStorage();
    changeState(SignUpLoadingState());
    try {
      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );
      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
      } else {
        throw Exception();
      }
      changeState(SignUpSuccessState());
    } catch (e) {
      changeState(SignUpErrorState(e.toString()));
    }
  }
}
