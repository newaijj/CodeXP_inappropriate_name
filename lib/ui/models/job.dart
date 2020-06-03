import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Job {
  String jobTitle, companyName, jobType, location, logourl;
  DateTime closingDate;
  IconData icon;

  Job(
      {this.jobTitle,
      this.companyName,
      this.jobType,
      this.location,
      this.closingDate,
      this.icon,
      this.logourl});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobTitle: json['jobTitle'],
      companyName: json['companyName'],
      jobType: json['jobType'],
      location: json['location'],
      closingDate: json['closingDate'],
      logourl: json['logourl'],
    );
  }
}
