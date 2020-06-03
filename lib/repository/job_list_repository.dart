import 'dart:convert';

import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:http/http.dart' as http;

class JobsListRepository {
  Future<List<Job>> fetchJobs() async {
    List<Job> jobs = List();
    final response =
        await http.get('https://ipozkax46c.execute-api.ap-southeast-1.amazonaws.com/dev/');

    if (response.statusCode == 200) {
      print(response.body);
      Iterable list = json.decode(response.body);
      return jobs = list.map((model) => Job.fromJson(model)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
