import 'dart:developer';
import 'package:app_financeiro/common/constants/routes.dart';
import 'package:app_financeiro/common/utils/uppercase_text_formatter.dart';
import 'package:app_financeiro/common/utils/validator.dart';
import 'package:app_financeiro/common/widgets/custom_bottom_sheet.dart';
import 'package:app_financeiro/common/widgets/custom_circular_progress_indicator.dart';
import 'package:app_financeiro/common/widgets/custom_text_form_field.dart';
import 'package:app_financeiro/common/widgets/password_form_field.dart';
import 'package:app_financeiro/features/sign_up/sign_up_controller.dart';
import 'package:app_financeiro/features/sign_up/sign_up_state.dart';
import 'package:app_financeiro/locator.dart';
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

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _controller = locator.get<SignUpController>();

  @override
  void initState() {
    _controller.addListener(
      () {
        log(_controller.state.toString());

        if (_controller.state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator(),
          );
        }

        if (_controller.state is SignUpSuccessState) {
          Navigator.popAndPushNamed(
            context,
            NamedRoutes.home,
          );
        }

        if (_controller.state is SignUpErrorState) {
          final error = _controller.state as SignUpErrorState;
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
                  controller: _nameController,
                  labelText: "your name",
                  hintText: "John Doe",
                  inputFormatters: [
                    UppercaseTextFormatter(),
                  ],
                  validator: Validator.validateName,
                ),
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
                PasswordFormField(
                  validator: (value) => Validator.validateConfirmPassword(
                    _passwordController.text,
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
                  _controller.signUp(
                    name: _nameController.text,
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
                Navigator.popAndPushNamed(context, NamedRoutes.signIn),
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
