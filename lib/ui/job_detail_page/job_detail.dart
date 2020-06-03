import 'package:codexp_inapporpriate_name/ui/apply/apply_page.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  static const String routeName = "/jobdetail";
  final Job job;

  const JobDetailPage({Key key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 85,
              child: Hero(
                tag: job.jobTitle,
                child: Material(
                  color: Colors.transparent,
                  child: Icon(this.job.icon, size: 80),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text("Share"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ApplyPage()));
                },
                child: Text("Apply"),
              )
            ],
          )
        ],
      ),
    ));
  }
}
