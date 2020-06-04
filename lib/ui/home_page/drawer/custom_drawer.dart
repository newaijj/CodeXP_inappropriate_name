import 'package:auto_size_text/auto_size_text.dart';
import 'package:codexp_inapporpriate_name/ui/login_page/login_page.dart';
import 'package:codexp_inapporpriate_name/ui/settings/settings.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../repository/authentication_bloc/authentication_bloc.dart';

class CustomDrawer extends StatelessWidget {
  final BuildContext context;

  const CustomDrawer({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xFFfbab66),
        //other styles
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              bloc: _authenticationBloc,
              builder: (context, state) {
                if (state is Authenticated) {
                  return DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        AutoSizeText(
                          'WORK AT HOME',
                          style: TextStyle(fontSize: 23),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(state.displayName),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFf7418c),
                    ),
                  );
                }
                return DrawerHeader(
                  child: Column(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Login/Register"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider.value(
                                        value: _authenticationBloc,
                                        child: LoginPage(),
                                      )));
                        },
                      )
                    ],
                  ),
                );
              },
            ),
            // ListTile(
            //   title: Text("Dark Theme"),
            //   trailing: PlatformSwitch(
            //     value: Theme.of(context).brightness == Brightness.dark,
            //     onChanged: (_) => changeBrightness(),
            //   ),
            // ),
//            ListTile(
//              title: Text("Settings"),
//              onTap: () {
//                Navigator.pushNamed(context, SettingsPage.routeName);
//              },
//            ),
            ListTile(
              title: Text("Sign Out"),
              onTap: () {
                _authenticationBloc.add(LoggedOut());
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }
}
