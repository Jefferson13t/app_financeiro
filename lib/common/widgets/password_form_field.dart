import 'package:app_financeiro/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
  });

  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: _visible,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        icon: Icon(
          _visible ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    );
  }
}
