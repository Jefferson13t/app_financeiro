import 'package:app_financeiro/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:app_financeiro/common/constants/app_colors.dart';
import 'package:app_financeiro/common/widgets/primary_button.dart';

Future<dynamic> customModalBottomSheet(
  BuildContext context, {
  String? content,
  String? buttonText,
}) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(38),
        topRight: Radius.circular(38),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          ),
          color: AppColors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                content ?? "",
                style: AppTextStyles.smallText20.copyWith(
                  color: AppColors.greenOne,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32,
                ),
                child: PrimaryButton(
                  text: buttonText ?? "",
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
