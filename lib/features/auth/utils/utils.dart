import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';

// VARIABLES
final today = DateTime.now();
final initialDate = today.subtract(const Duration(days: 365 * 18));
// El usuario debe haber nacido después de 1950.
final firstDate = DateTime(1950);
// El usuario debe tener al menos 7 años de edad.
final lastDate = today.subtract(const Duration(days: 365 * 7));

// MÉTODOS

// Valida un correo electrónico introducido
String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final isEmailValid = emailRegex.hasMatch(email ?? '');
  if (!isEmailValid) return 'Por favor ingrese un email válido.';
  return null;
}

// Valida un nombre / apellidos introducidos
String? validateName(String? name) {
  RegExp nameRegex = RegExp(r'^[a-zA-Z\s]{1,50}$');

  if (name == null) {
    return 'El nombre no puede estar vacío.';
  } else if (name.isEmpty) {
    return 'El nombre no puede estar vacío.';
  } else if (!nameRegex.hasMatch(name)) {
    return 'Por favor ingrese un nombre válido.';
  }

  return null;
}

// Valida la contraseña introducida
String? validatePassword(String? password) {
  RegExp passwordRegex = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');

  if (password == null) {
    return 'La contraseña no puede estar vacía.';
  } else if (password.isEmpty) {
    return 'La contraseña no puede estar vacía.';
  } else if (!passwordRegex.hasMatch(password)) {
    return 'La contraseña debe contener al menos una letra minúscula, una letra mayúscula, un dígito y tener una longitud mínima de 8 caracteres.';
  }

  return null;
}

// Selecciona una fecha para calcular el cumpleaños
Future<DateTime?> pickSimpleDate({
  required BuildContext context,
  required DateTime? date,
}) async {
  final dateTime = await DatePicker.showSimpleDatePicker(
    context,
    initialDate: date ?? initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
    dateFormat: 'dd-MMMM-yyyy',
  );

  return dateTime;
}
