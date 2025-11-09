import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedBottom extends StatelessWidget {
  Function onPressed;
  String text;
  CustomElevatedBottom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryLight,
      ),
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryLight),
        ),
        onPressed: () {
          onPressed();
        },
        child: Text(text, style: AppStyles.medium20White),
      ),
    );
  }
}
