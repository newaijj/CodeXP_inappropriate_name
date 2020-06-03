import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:codexp_inapporpriate_name/ui/apply/apply_page.dart';
import 'package:codexp_inapporpriate_name/ui/apply/apply_page_scroll.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:flutter/material.dart';

import '../camera.dart';

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
                  tag: this.job.logourl,
                  child: CachedNetworkImage(imageUrl: this.job.logourl)),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApplyPageScroll()));
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
