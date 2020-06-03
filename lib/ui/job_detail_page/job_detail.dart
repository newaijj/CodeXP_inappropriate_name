import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:codexp_inapporpriate_name/ui/apply/apply_page.dart';
import 'package:codexp_inapporpriate_name/ui/apply/apply_page_scroll.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:codexp_inapporpriate_name/ui/camera.dart';

class JobDetailPage extends StatefulWidget {
  static const String routeName = "/jobdetail";
  final Job job;

  const JobDetailPage({Key key, this.job}) : super(key: key);

  @override
  _JobDetailPageState createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
    with AutomaticKeepAliveClientMixin {
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
                  tag: this.widget.job.logourl,
                  child: CachedNetworkImage(imageUrl: this.widget.job.logourl)),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(
                  onPressed: () {},
                  child: Text("Share"),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                ),
                SizedBox(
                  width: 10,
                ),
                OutlineButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ApplyPageScroll()));
                  },
                  child: Text("Apply"),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder(
                horizontalInside: new BorderSide(color: Colors.black, width: 1),
              ),
              children: [
                TableRow(children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Job Title")))),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.job.jobTitle))),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Company Name")))),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.job.companyName,
                            ))),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Job Type")))),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.job.jobType))),
                  )
                ]),
                TableRow(children: [
                  TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Location")))),
                  TableCell(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.job.location))),
                  )
                ]),
                // TableRow(children: [
                //   TableCell(
                //       child: Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: Align(
                //               alignment: Alignment.centerLeft,
                //               child: Text("Closing Date")))),
                //   TableCell(
                //     child: Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Align(
                //             alignment: Alignment.centerLeft,
                //             child: Text(DateFormat('yyyy-MM-dd – kk:mm')
                //                 .format(job.closingDate)))),
                //   )
                // ]),
                // TableRow(children: [
                //   TableCell(
                //       child: Padding(
                //           padding: EdgeInsets.all(8.0),
                //           child: Align(
                //               alignment: Alignment.centerLeft,
                //               child: Text("Closing Date")))),
                //   TableCell(
                //     child: Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Align(
                //             alignment: Alignment.centerLeft,
                //             child: Text(DateFormat('yyyy-MM-dd – kk:mm')
                //                 .format(job.closingDate)))),
                //   )
                // ]),
              ],
            ),
          )
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
