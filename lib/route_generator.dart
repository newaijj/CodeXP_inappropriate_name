import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/login_page/login_page.dart';

class AppRouter {
  final BuildContext context;

  AppRouter(this.context);
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}
