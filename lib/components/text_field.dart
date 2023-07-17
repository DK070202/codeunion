import 'package:codeunion/app/config/config.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hint,
    super.key,
  });
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.offWhite,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 19,
      ),
      child: TextField(
        decoration: InputDecoration.collapsed(
          hintText: hint,
        ),
      ),
    );
  }
}
