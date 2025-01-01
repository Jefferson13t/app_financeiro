import 'dart:developer';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/common/utils/validator.dart';
import 'package:app_financeiro/common/widgets/custom_bottom_sheet.dart';
import 'package:app_financeiro/common/widgets/custom_circular_progress_indicator.dart';
import 'package:app_financeiro/common/widgets/custom_text_form_field.dart';
import 'package:app_financeiro/common/widgets/password_form_field.dart';
import 'package:app_financeiro/features/sign_In/sign_In_state.dart';
import 'package:app_financeiro/features/sign_in/sign_in_controller.dart';
import 'package:app_financeiro/locator.dart';
import 'package:flutter/material.dart';
import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:app_financeiro/common/widgets/multi_text_button.dart';
import 'package:app_financeiro/common/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _controller = locator.get<SignInController>();

  @override
  void initState() {
    _controller.addListener(
      () {
        log(_controller.state.toString());

        if (_controller.state is SignInLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }

        if (_controller.state is SignInSuccessState) {
          Navigator.popAndPushNamed(
            context,
            NamedRoutes.home,
          );
        }

        if (_controller.state is SignInErrorState) {
          final error = _controller.state as SignInErrorState;
          Navigator.pop(context);
          customModalBottomSheet(
            context,
            content: error.message,
            buttonText: 'Tentar Novamente',
          );
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            "Welcome Back",
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.greenTwo,
            ),
          ),
          Image.asset("assets/images/sign_in_image.png"),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: "your email",
                  hintText: "email@email.com",
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  labelText: "Choose your password",
                  controller: _passwordController,
                  hintText: "********",
                  validator: Validator.validatePassword,
                  helperText:
                      "Deve ter 8 caracteres, 1 letra maiuscula e 1 numero",
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
              text: "Sign In",
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();

                if (valid) {
                  _controller.signIn(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  log("Erro ao logar");
                }
              },
            ),
          ),
          MultiTextButton(
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoutes.signUp),
            children: [
              Text(
                "Doesn't Have an Account? ",
                style:
                    AppTextStyles.smallText.copyWith(color: AppColors.darkGrey),
              ),
              Text(
                "Sign Up",
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
