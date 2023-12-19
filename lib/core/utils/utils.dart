import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

// MÉTODOS

// Selecciona una foto del dispositivo
Future<File?> pickImage() async {
  try {
    File? image;
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 720,
    );

    if (file != null) {
      image = File(file.path);
    }

    return image;
  } catch (e) {
    e.toString();
  }
  return null;
}

// Muestra un mensaje de notificación al usuario : Toast
void showToastMessage({
  required String message,
}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
    toastLength: Toast.LENGTH_LONG,
  );
}