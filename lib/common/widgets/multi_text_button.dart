import 'package:flutter/material.dart';

class MultiTextButton extends StatelessWidget {
  const MultiTextButton({
    super.key,
    required this.children,
    required this.onPressed,
  });

  final List<Text> children;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
