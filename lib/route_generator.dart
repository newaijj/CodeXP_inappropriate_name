import 'package:codexp_inapporpriate_name/ui/job_detail_page/job_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/apply/apply_page.dart';
import 'ui/home_page/home_page.dart';
import 'ui/login_page/login_page.dart';

class AppRouter {
  final BuildContext context;

  AppRouter(this.context);
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case JobDetailPage.routeName:
        return MaterialPageRoute(builder: (_) => JobDetailPage());
      case ApplyPage.routeName:
        return MaterialPageRoute(builder: (_) => ApplyPage());
    }
  }
}
