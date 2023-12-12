import 'dart:io';

import 'package:eggymood_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:eggymood_app/core/constants/app_colors.dart';
import 'package:eggymood_app/core/utils/utils.dart';
import 'package:eggymood_app/core/widgets/pick_image.dart';
import 'package:eggymood_app/core/widgets/round_button.dart';
import 'package:eggymood_app/core/widgets/round_text_field.dart';
import 'package:eggymood_app/features/auth/presentation/widgets/birthday_picker.dart';
import 'package:eggymood_app/features/auth/presentation/widgets/gender_picker.dart';
import 'package:eggymood_app/features/auth/utils/utils.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static const routeName = '/create-account';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  // Variables
  final _formKey = GlobalKey<FormState>();
  File? image;
  DateTime? birthday;
  String gender = 'hombre';
  bool isLoading = false;

  // Controladores
  late final TextEditingController _fNameController;
  late final TextEditingController _lNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                      onTap: () async {
                        image = await pickImage();
                        setState(() {});
                      },
                      child: PickImageWidget(image: image)),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Campo Nombre (First Name)
                      Expanded(
                          child: RoundTextField(
                        controller: _fNameController,
                        hintText: 'Nombre',
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      )),
                      const SizedBox(width: 10),
                      // Campo Apellido (Last Name)
                      Expanded(
                          child: RoundTextField(
                        controller: _lNameController,
                        hintText: 'Apellido',
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Campo Correo Electrónico (Email)
                  RoundTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 20),
                  // Campo Contraseña (Password)
                  RoundTextField(
                    controller: _passwordController,
                    hintText: 'Contraseña',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    validator: validatePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  BirthdayPicker(
                      dateTime: birthday ?? DateTime.now(),
                      onPressed: () async {
                        birthday = await pickSimpleDate(
                          context: context,
                          date: birthday,
                        );
                        setState(() {});
                      }),
                  const SizedBox(height: 20),
                  GenderPicker(
                      gender: gender,
                      onChanged: (value) {
                        gender = value ?? 'hombre';
                        setState(() {});
                      }),
                  const SizedBox(height: 20),
                  RoundButton(onPressed: () {}, label: 'Crear Cuenta'),
                ],
              )),
        ),
      ),
    );
  }
}
