import 'package:flutter/material.dart';

import 'package:eggymood_app/features/auth/presentation/screens/verify_email_screen.dart';
import 'package:eggymood_app/config/routes/routes.dart';
import 'package:eggymood_app/config/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      title: 'EggyMood',
      home: const VerifyEmailScreen(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
