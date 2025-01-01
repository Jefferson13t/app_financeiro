import 'package:app_financeiro/features/sign_in/sign_in_controller.dart';
import 'package:app_financeiro/features/sign_up/sign_up_controller.dart';
import 'package:app_financeiro/features/splash/splash_controller.dart';
import 'package:app_financeiro/services/auth_service.dart';
import 'package:app_financeiro/services/mock_auth_service.dart';
import 'package:app_financeiro/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(
    () => MockAuthService(),
  );

  locator.registerFactory<SplashController>(
    () => SplashController(
      const SecureStorage(),
    ),
  );

  locator.registerFactory<SignInController>(
    () => SignInController(
      locator.get<AuthService>(),
    ),
  );

  locator.registerFactory<SignUpController>(
    () => SignUpController(
      locator.get<AuthService>(),
    ),
  );
}