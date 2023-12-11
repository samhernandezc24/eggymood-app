import 'package:eggymood_app/core/screens/error_screen.dart';
import 'package:eggymood_app/core/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return _cupertinoRoute(
          const HomeScreen(),
        );
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: '${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(builder: (_) => view);

  Routes._();
}