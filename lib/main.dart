import 'package:codexp_inapporpriate_name/theme/theme.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repository/authentication_bloc/authentication_bloc.dart';
import 'route_generator.dart';
import 'ui/login_page/repository/UserRepository.dart';

void main() {
  final UserRepository userRepository = UserRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (BuildContext context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
        },
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    final _router = AppRouter(context, _authenticationBloc);
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => buildTheme(brightness),
      themedWidgetBuilder: (context, theme) {
        return new MaterialApp(
          title: 'DSTA HACKATHON',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: _router.generateRoute,
        );
      },
    );
  }
}
