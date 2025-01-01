import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/common/widgets/custom_circular_progress_indicator.dart';
import 'package:app_financeiro/features/splash/splash_controller.dart';
import 'package:app_financeiro/features/splash/splash_state.dart';
import 'package:app_financeiro/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        Navigator.pushReplacementNamed(
          context,
          NamedRoutes.home,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          NamedRoutes.initial,
        );
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.greenGradient),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "financy",
              style: AppTextStyles.bigText.copyWith(color: AppColors.white),
            ),
            const CustomCircularProgressIndicator(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
