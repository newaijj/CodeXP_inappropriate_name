import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final text;
  const SkillCard({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Text(this.text),
      ),
    );
  }
}