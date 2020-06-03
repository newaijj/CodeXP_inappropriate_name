import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:codexp_inapporpriate_name/ui/home_page/skill_card.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobCard extends StatelessWidget {
  final Job job;
  final VoidCallback callback;
  const JobCard({Key key, this.job, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: this.callback,
        child: Row(
          children: [
            Hero(
              tag: this.job.logourl,
              child: Container(
                width: 80,
                padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                child: ClipRRect(
                    child: CachedNetworkImage(imageUrl: this.job.logourl,)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                AutoSizeText(
                  this.job.jobTitle,
                  style: TextStyle(fontSize: 23),
                  maxLines: 2,
                ),
                AutoSizeText(
                  this.job.companyName,
                  style: TextStyle(fontSize: 16),
                  maxLines: 1,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 114,
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SkillCard(text: "Html"),
                      SkillCard(text: "CSS"),
                      SkillCard(text: "JavaScript"),
                      SkillCard(text: "TypeScript"),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(FontAwesomeIcons.mapMarkerAlt),
                    ),
                    Text(
                      this.job.location,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(height: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
