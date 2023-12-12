import 'package:flutter/material.dart';

import 'package:eggymood_app/core/constants/constants.dart';
import 'package:eggymood_app/features/auth/presentation/widgets/info_text.dart';
import 'package:eggymood_app/features/auth/presentation/widgets/resend_button.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: Constants.defaultPadding * 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                _buildIllustration(),
                const SizedBox(height: Constants.defaultSpacing * 4),
                const InfoText(email: 'info@email.com'),
                const Spacer(),
                _buildResendButton(),
                const SizedBox(height: Constants.defaultSpacing),
              ],
            ),
          ),
        ));
  }

  Widget _buildIllustration() {
    return Image.asset(
      'assets/images/email.png',
      height: 200,
    );
  }

  Widget _buildResendButton() {
    return ResendButton(
      onPressed: () {},
      isLoading: false,
    );
  }
}
