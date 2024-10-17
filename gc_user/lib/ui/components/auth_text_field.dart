import 'package:flutter/material.dart';
import 'package:gc_user/core/style/colors.dart';
import 'package:gc_user/core/style/typography.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obsecureText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.obsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.authFieldsForegroundColor,
          ),
          hintText: hintText,
          filled: true,
          fillColor: AppColors.authFieldsBackgroundColor,
          hintStyle: AppTypography.authFieldTextStyle,
          constraints: const BoxConstraints(maxWidth: 333),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }
}
