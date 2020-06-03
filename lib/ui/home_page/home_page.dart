import 'package:codexp_inapporpriate_name/repository/authentication_bloc/authentication_bloc.dart';
import 'package:codexp_inapporpriate_name/repository/job_list_repository.dart';
import 'package:codexp_inapporpriate_name/ui/login_page/login_page.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:codexp_inapporpriate_name/ui/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolling_nav_bar/indexed.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';
import 'package:codexp_inapporpriate_name/style/theme.dart' as Theme;

import 'bloc/job_list_bloc.dart';
import 'drawer/custom_drawer.dart';
import 'job_list_page.dart';

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

class HomePage extends StatefulWidget {
  static const String routeName = "/";

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  int activeIndex;
  Color logoColor;
  PageController _pageController;

  var iconData = <IconData>[
    Icons.home,
    Icons.people,
    // Icons.account_circle,
    // Icons.chat,
    // Icons.settings,
  ];

  var badges = <int>[null, null];

  var iconText = <Widget>[
    Text('All Jobs', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('Existing Applications', style: TextStyle(color: Colors.grey, fontSize: 12)),
  ];

  var indicatorColors = <Color>[
    Colors.red,
    Colors.orange,
  ];

  List<Widget> get badgeWidgets => indexed(badges)
      .map((Indexed indexed) => indexed.value != null
          ? Text(indexed.value.toString(),
              style: TextStyle(
                color: indexed.index == activeIndex
                    ? indicatorColors[indexed.index]
                    : Colors.white,
              ))
          : null)
      .toList();

  @override
  void initState() {
    logoColor = Colors.red[600];
    _pageController = PageController(initialPage: 0);
    activeIndex = 0;
    super.initState();
  }

  // void incrementIndex(int index) {
  //   setState(() {
  //     activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
  //     print(activeIndex);
  //   });
  // }

  // void changeActiveIndex(int index) {
  //   setState(() {
  //     activeIndex = index;
  //   });
  // }

  // ignore: unused_element
  _onAnimate(AnimationUpdate update) {
    setState(() {
      logoColor = update.color;
    });
  }

  _onTap(int index) {
    print(index);
    // changeActiveIndex(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  void _incrementBadge() {
    badges[activeIndex] =
        badges[activeIndex] == null ? 1 : badges[activeIndex] + 1;
    setState(() {});
  }

  List<Widget> get builderChildren => const <Widget>[
        Text('1', style: TextStyle(color: Colors.grey)),
        Text('2', style: TextStyle(color: Colors.grey)),
        Text('3', style: TextStyle(color: Colors.grey)),
      ];

  List<Widget> _pages = List();

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    _pages.add(JobListPage());
    // _pages.add(Center(
    //     child: MaterialButton(
    //   child: Text("Login"),
    //   onPressed: () {
    //     Navigator.pushNamed(context, LoginPage.routeName);
    //   },
    // )));
    // _pages.add(Center(child: Container(child: Text("Page 3"))));
    // _pages.add(Center(child: Container(child: Text("Page 4"))));
    _pages.add(SettingsPage());
    double navBarHeight = scaledHeight(context, 85);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("JOBS APP"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.Colors.loginGradientStart,
                    Theme.Colors.loginGradientEnd
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
        ),
      ),
      drawer: BlocProvider.value(
        value: authenticationBloc,
        child: CustomDrawer(context: context),
      ),
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          controller: _pageController,
          itemBuilder: (context, index) {
            return _pages[index];
          },
          onPageChanged: (index) {
            setState(() {
              activeIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: Container(
        // bottom: 0,
        height: navBarHeight,
        width: MediaQuery.of(context).size.width,
        // Option 1: Recommended
        child: RollingNavBar.iconData(
          activeBadgeColors: <Color>[
            Colors.white,
          ],
          activeIndex: activeIndex,
          animationCurve: Curves.linear,
          animationType: AnimationType.shrinkOutIn,
          baseAnimationSpeed: 200,
          badges: badgeWidgets,
          iconData: iconData,
          iconColors: <Color>[Colors.grey[800]],
          iconText: iconText,
          indicatorColors: indicatorColors,
          iconSize: 25,
          indicatorRadius: scaledHeight(context, 30),
          onAnimate: _onAnimate,
          onTap: _onTap,
        ),
      ),
    );
  }
}
