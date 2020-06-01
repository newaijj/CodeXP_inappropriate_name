import 'package:cached_network_image/cached_network_image.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:flutter/material.dart';

class JobDetailPage extends StatelessWidget {
  static const String routeName = "jobdetail";
  final Job job;

  const JobDetailPage({Key key, this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Hero(
        tag: job.jobTitle,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            // child: CachedNetworkImage(imageUrl: course.image),
          ),
        ),
      ),
    ));
  }
}
