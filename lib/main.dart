import 'package:eggymood_app/config/routes/routes.dart';
import 'package:eggymood_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EggyMood',
      home: CreateAccountScreen(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
