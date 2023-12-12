import 'package:eggymood_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {required this.onPressed,
      required this.label,
      super.key,
      this.color = AppColors.lightPrimaryColor,
      this.height = 50});

  final VoidCallback? onPressed;
  final String label;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (color == AppColors.lightPrimaryColor && onPressed != null)
                  ? AppColors.blackColor
                  : AppColors.darkPrimaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
