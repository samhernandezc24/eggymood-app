import 'package:eggymood_app/features/auth/presentation/widgets/gender_radio_tile.dart';
import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({Key? key, this.gender, required this.onChanged})
      : super(key: key);

  final String? gender;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue[500],
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
