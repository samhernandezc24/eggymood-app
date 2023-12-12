import 'package:flutter/material.dart';

import 'package:eggymood_app/core/constants/app_colors.dart';
import 'package:eggymood_app/features/auth/presentation/widgets/gender_radio_tile.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({Key? key, this.gender, required this.onChanged})
      : super(key: key);

  final String? gender;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.darkWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          GenderRadioTile(
              title: 'Hombre',
              value: 'hombre',
              selectedValue: gender,
              onChanged: onChanged),
          GenderRadioTile(
              title: 'Mujer',
              value: 'mujer',
              selectedValue: gender,
              onChanged: onChanged),
        ],
      ),
    );
  }
}
