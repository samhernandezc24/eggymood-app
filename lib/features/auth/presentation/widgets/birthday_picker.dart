import 'package:eggymood_app/core/constants/extensions.dart';
import 'package:flutter/material.dart';

class BirthdayPicker extends StatelessWidget {
  const BirthdayPicker(
      {required this.dateTime, required this.onPressed, super.key});

  final DateTime dateTime;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Cumpleaños (${DateTime.now().year - dateTime.year} años de edad)',
                style: const TextStyle(color: Colors.black)),
            const SizedBox(height: 5),
            Text(dateTime.yMMMEd(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
