import 'package:flutter/material.dart';
import 'package:gc_user/core/style/colors.dart';
import 'package:gc_user/core/style/sizes.dart';
import 'package:gc_user/core/style/typography.dart';

class CustomAuthButton extends StatelessWidget {
  final bool isDisabled;
  final String buttonText;
  const CustomAuthButton({
    super.key,
    required this.buttonText,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: Size(
            AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedWidth(303),
            AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedHeight(43.6)),
        foregroundColor: AppColors.authButtonForegroundColor,
        backgroundColor: isDisabled
            ? AppColors.authButtonDisabledBackgroundColor
            : AppColors.authButtonEnabledBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: AppTypography.authButtonTextStyle,
      ),
    );
  }
}
