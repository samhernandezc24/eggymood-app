import 'package:flutter/material.dart';

import 'package:eggymood_app/core/constants/app_colors.dart';
import 'package:eggymood_app/core/constants/constants.dart';

class ResendButton extends StatelessWidget {
  const ResendButton(
      {Key? key, required this.onPressed, required this.isLoading})
      : super(key: key);

  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Aún no has recibido el correo electrónico?',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
        ),
        if (isLoading) const SizedBox(width: Constants.defaultSpacing / 2),
        TextButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? const SizedBox(
                  width: 15, height: 15, child: CircularProgressIndicator())
              : const Text(
                  'Reenviar',
                  style: TextStyle(
                    color: AppColors.darkPrimaryColor,
                    fontSize: 16,
                  ),
                ),
        ),
      ],
    );
  }
}
