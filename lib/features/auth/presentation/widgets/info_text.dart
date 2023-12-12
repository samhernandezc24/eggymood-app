import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  const InfoText({Key? key, required this.email}) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).textTheme.bodySmall?.color,
          height: 1.5,
        ),
        children: email == null
            ? [
                const TextSpan(
                  text: 'wefwefwe',
                ),
              ]
            : [
                const TextSpan(
                  text:
                      'Hemos enviado un correo electrónico de confirmación a ',
                ),
                TextSpan(
                  text: email,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const TextSpan(
                  text:
                      ', compruebe su correo electrónico y haga clic en el enlace de confirmación para continuar.',
                ),
              ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
