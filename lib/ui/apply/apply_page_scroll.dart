import 'dart:io';

import 'package:codexp_inapporpriate_name/ui/apply/video_recorder.dart';
import 'package:flutter/material.dart';

class ApplyPageScroll extends StatefulWidget {
  ApplyPageScroll({Key key}) : super(key: key);

  @override
  _ApplyPageScrollState createState() => _ApplyPageScrollState();
}

class _ApplyPageScrollState extends State<ApplyPageScroll> {
  Animatable<Color> background;
  PageController pageController;

  @override
  void initState() {
    background = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.orange[600],
          end: Colors.deepPurple[400],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.deepPurple[400],
          end: Colors.yellow[300],
        ),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(
          begin: Colors.yellow[300],
          end: Colors.blue[400],
        ),
      ),
    ]);
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Card(
                  elevation: 8.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 8),
                      Center(
                          child: Text(
                        "Application Procedure",
                        style: TextStyle(fontSize: 24),
                      )),
                      SizedBox(height: 8),
                    ],
                  )),
            ),
            Flexible(
              flex: 13,
              child: AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  final color =
                      pageController.hasClients ? pageController.page / 3 : .0;

                  return Card(
                    color: background.evaluate(AlwaysStoppedAnimation(color)),
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      children: [
                        FirstPage(),
                        SecondPage(),
                        ThirdPage(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key key}) : super(key: key);
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: Card(
            child: Center(
              child: Text(
                "STEP 1: INTRODUCE YOURSELF",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
         Flexible(
           flex: 13,
           child: Card(
             child: Column(
               children: [
                 Container(
                   width: 300,
                   height: 600,
                   child: VideoRecorderExample(),
                 )
               ],
             ),
           ),
         )
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: Card(
            child: Center(
              child: Text(
                "STEP 2: CHALLENGING QUESTION 1",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
         Flexible(
           flex: 13,
           child: Card(
             child: Column(
               children: [
                 Container(
                   width: 300,
                   height: 600,
                   child: VideoRecorderExample(),
                 )
               ],
             ),
           ),
         )
      ],
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: Card(
            child: Center(
              child: Text(
                "STEP 3: CHALLENGING QUESTION 2",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
         Flexible(
           flex: 13,
           child: Card(
             child: Column(
               children: [
                 Container(
                   width: 300,
                   height: 600,
                   child: VideoRecorderExample(),
                 )
               ],
             ),
           ),
         )
      ],
    );
  }
}
