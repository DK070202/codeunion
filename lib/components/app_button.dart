import 'package:codeunion/app/config/config.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Visibility(
        visible: !isLoading,
        replacement: const SizedBox.square(
          dimension: 35,
          child: CircularProgressIndicator(
            color: AppColors.white,
          ),
        ),
        child: Text(
          label,
        ),
      ),
    );
  }
}
