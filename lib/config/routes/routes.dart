import 'package:eggymood_app/core/screens/error_screen.dart';
import 'package:eggymood_app/core/screens/home_screen.dart';
import 'package:eggymood_app/features/auth/presentation/screens/create_account_screen.dart';
import 'package:eggymood_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // C
      case CreateAccountScreen.routeName:
        return _cupertinoRoute(
          const CreateAccountScreen(),
        );

      // H
      case HomeScreen.routeName:
        return _cupertinoRoute(
          const HomeScreen(),
        );

      // L
      case LoginScreen.routeName:
        return _cupertinoRoute(
          const LoginScreen(),
        );

      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: '${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) =>
      CupertinoPageRoute(builder: (_) => view);

  Routes._();
}
