import 'package:codeunion/app/config/config.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hint,
    this.onChanged,
    super.key,
  });
  final String hint;

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.offWhite,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 19,
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration.collapsed(
          hintText: hint,
        ),
      ),
    );
  }
}
