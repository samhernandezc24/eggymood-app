import 'package:eggymood_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:eggymood_app/core/constants/app_colors.dart';
import 'package:eggymood_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:eggymood_app/core/widgets/round_button.dart';
import 'package:eggymood_app/core/widgets/round_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Variables
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // Controladores
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/icons/gudetama_logo.png',
              width: 100,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      textInputAction: TextInputAction.next),
                  const SizedBox(height: 15),
                  RoundTextField(
                    controller: _passwordController,
                    hintText: 'Contraseña',
                    textInputAction: TextInputAction.done,
                    isPassword: true,
                  ),
                  const SizedBox(height: 15),
                  RoundButton(onPressed: () {}, label: 'Entrar'),
                  const SizedBox(height: 15),
                  const Text(
                    '¿Has olvidado tu contraseña?',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        CreateAccountScreen.routeName,
                      );
                    },
                    child: const Text(
                      '¿Aún no tienes cuenta?',
                      style: TextStyle(
                        color: AppColors.darkPrimaryColor,
                        fontSize: 18,
                      ),
                    )),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/icons/gudetama.png',
                  height: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
