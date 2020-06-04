import 'package:cached_network_image/cached_network_image.dart';
//import 'package:camera/camera.dart';
import 'package:codexp_inapporpriate_name/ui/apply/apply_page.dart';
import 'package:codexp_inapporpriate_name/ui/apply/apply_page_scroll.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
  String data =
      """"<p>The wealth of a nation lies in its people - their commitment to country and community, their willingness to strive and persevere, their ability to think, achieve and excel. Our future depends on our continually renewing and regenerating our leadership and citizenry, building upon the experience of the past, learning from the circumstances of the present, and preparing for the challenges of the future. How we bring up our young at home and teach them in school will shape Singapore in the next generation. <br><br> The mission of the Education Service is to mould the future of the nation, by moulding the people who will determine the future of the nation. The Service will provide our children with a balanced and well-rounded education, develop them to their full potential, and nurture them into good citizens, conscious of their responsibilities to family, society and country. 
</p>
<div id="job-details">
   <p><strong>Job Description</strong></p>
<p>As a Manager/ Senior Manager, Data Management in the Student Development Curriculum Division, you will be working on data management and analysis of issues related to mental health, cyber wellness, education and career guidance to inform research and policy recommendations.</p>
<p>Your key responsibilities include:</p>
<p style="padding-left: 30px">•&nbsp;Providing data mining and analytics-related support to research projects undertaken by the branch<br>•&nbsp;Supporting research teams in quantitative and qualitative analyses, including participating in the research<br>•&nbsp;Reviewing and documenting key data management work processes including enhancing data mining and extraction, and information management systems used to generate data<br>•&nbsp;Enhancing the competency of officers in statistical methods and data analytics by organizing sharing and training sessions for officers</p>
<p><br><strong>Requirements</strong></p>
<p style="padding-left: 30px">•&nbsp;Good working knowledge of statistics, measurement and research with at least 2 years of experience in data analytics<br>•&nbsp;Proficient in data analytics, Microsoft Excel, Tableau or other data analytic tools<br>•&nbsp;Strong analytical, quantitative as well as communication and presentation skills<br>•&nbsp;Familiarity with research methodologies and ability to work effectively within tight deadlines<br>•&nbsp;A detailed-oriented individual who is able to work well in teams and collaborate with various stakeholders<br>•&nbsp;Proficiency in coding would be an advantage</p>
""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 85,
                child: Hero(
                    tag: this.widget.job.logourl,
                    child:
                        CachedNetworkImage(imageUrl: this.widget.job.logourl)),
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
//                  OutlineButton(
//                    onPressed: () {},
//                    child: Text("Share"),
//                    shape: new RoundedRectangleBorder(
//                        borderRadius: new BorderRadius.circular(30.0)),
//                  ),
//                  SizedBox(
//                    width: 10,
//                  ),
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
                  horizontalInside:
                      new BorderSide(color: Colors.black, width: 1),
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
            ),
            Html(
              data: data,
            )
          ],
        ),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
