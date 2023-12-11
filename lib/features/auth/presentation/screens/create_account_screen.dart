import 'dart:io';

import 'package:eggymood_app/core/utils/utils.dart';
import 'package:eggymood_app/core/widgets/pick_image.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () async {
                        image = await pickImage();
                        setState(() {});
                      },
                      child: PickImageWidget(image: image))
                ],
              )),
        ),
      ),
    );
  }
}
