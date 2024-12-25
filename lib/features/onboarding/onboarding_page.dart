import 'dart:developer';
import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:app_financeiro/common/widgets/multi_text_button.dart';
import 'package:app_financeiro/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Expanded(
              child: Image.asset("assets/images/man.png"),
            ),
            Text(
              "Spend Smarter",
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
            ),
            Text(
              "Save More",
              style:
                  AppTextStyles.mediumText.copyWith(color: AppColors.greenTwo),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: "Get Started",
                onPressed: () {
                  log("Get Started");
                },
              ),
            ),
            MultiTextButton(
              onPressed: () {
                log('Login');
              },
              children: [
                Text(
                  "Already Have an Account? ",
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.darkGrey),
                ),
                Text(
                  "Log in",
                  style: AppTextStyles.smallText
                      .copyWith(color: AppColors.greenTwo),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
