import 'dart:developer';
import 'package:app_financeiro/common/utils/uppercase_text_formatter.dart';
import 'package:app_financeiro/common/utils/validator.dart';
import 'package:app_financeiro/common/widgets/custom_text_form_field.dart';
import 'package:app_financeiro/common/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:app_financeiro/common/widgets/multi_text_button.dart';
import 'package:app_financeiro/common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Spend Smarter",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            ),
          ),
          Text(
            "Save More",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            ),
          ),
          Image.asset("assets/images/sign_up_image.png"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: "your name",
                  hintText: "John Doe",
                  inputFormatters: [
                    UppercaseTextFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
                CustomTextFormField(
                  labelText: "your name",
                  hintText: "John Doe",
                  inputFormatters: [
                    UppercaseTextFormatter(),
                  ],
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  labelText: "Choose your password",
                  controller: passwordController,
                  hintText: "********",
                  validator: Validator.validatePassword,
                  helperText:
                      "Deve ter 8 caracteres, 1 letra maiuscula e 1 numero",
                ),
                PasswordFormField(
                  validator: (value) => Validator.validateConfirmPassword(
                    passwordController.text,
                    value,
                  ),
                  labelText: "Confirm your password",
                  hintText: "********",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
              top: 16,
              bottom: 4,
            ),
            child: PrimaryButton(
              text: "Sign Up",
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();

                if (valid) {
                } else {
                  log("Erro ao logar");
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () {
              log('Sign Up');
            },
            children: [
              Text(
                "Already Have an Account? ",
                style:
                    AppTextStyles.smallText.copyWith(color: AppColors.darkGrey),
              ),
              Text(
                "Log in",
                style:
                    AppTextStyles.smallText.copyWith(color: AppColors.greenTwo),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          )
        ],
      ),
    );
  }
}
