import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/features/home/home_page.dart';
import 'package:app_financeiro/features/onboarding/onboarding_page.dart';
import 'package:app_financeiro/features/sign_in/sign_in_page.dart';
import 'package:app_financeiro/features/sign_up/sign_up_page.dart';
import 'package:app_financeiro/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: defaultTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => const OnboardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.signIn: (context) => const SignInPage(),
        NamedRoutes.home: (context) => const HomePage(),
      },
    );
  }
}
