import 'package:flutter/material.dart';

class ApplyPage extends StatefulWidget {
  static const String routeName = "/applyPage";

  ApplyPage({Key key}) : super(key: key);

  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Flexible(
                flex: 5,
                child: Text("Application Procedure",
                    style: TextStyle(fontSize: 23))),
            Flexible(
                flex: 5,
                child: Text(
                    "This is an automated interview process. Do keep your videos short!",
                    style: TextStyle(fontSize: 16))),
            Flexible(
                flex: 100,
                child: Column(
                  children: [
                    Flexible(
                      child: ProcedureList(),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class ProcedureList extends StatelessWidget {
  const ProcedureList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          elevation: 8.0,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "STEP 1: INTRODUCE YOURSELF",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
              Text(
                  "Introduce yourself to us! Do include things like your name, hobbies and your interest!"),
              MaterialButton(
                onPressed: () {},
                child: Text("Upload Video"),
              )
            ],
          ),
        ),
        Card(
          elevation: 8.0,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "STEP 2: CHALLENGING QUESTION 1",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
              Text(
                  "This is a challenging question, do keep your video below 2 minutes"),
              MaterialButton(
                onPressed: () {},
                child: Text("Upload Video"),
              )
            ],
          ),
        ),
        Card(
          elevation: 8.0,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "STEP 3: CHALLENGING QUESTION 2",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
              Text(
                  "This is a challenging question, do keep your video below 2 minutes"),
              MaterialButton(
                onPressed: () {},
                child: Text("Upload Video"),
              )
            ],
          ),
        ),
        Card(
          elevation: 8.0,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "STEP 3: ADDITIONAL NOTES",
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
              Text(
                  "Do you have anything else to add to your interview?"),
              MaterialButton(
                onPressed: () {},
                child: Text("Upload Video"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
