import 'package:app_financeiro/features/splash/splash_state.dart';
import 'package:app_financeiro/services/secure_storage.dart';
import 'package:flutter/foundation.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> isUserLogged() async {
    final result = await _service.readOne(key: "CURRENT_USER");

    if (result != null) {
      changeState(SplashSuccessState());
    } else {
      changeState(SplashErrorState());
    }
  }
}
