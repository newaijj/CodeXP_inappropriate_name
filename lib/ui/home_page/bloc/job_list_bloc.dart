import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codexp_inapporpriate_name/repository/job_list_repository.dart';
import 'package:codexp_inapporpriate_name/ui/models/job.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  final JobsListRepository _jobsListRepository;

  JobListBloc({@required JobsListRepository jobsListRepository})
      : assert(jobsListRepository != null),
        _jobsListRepository = jobsListRepository;

  @override
  JobListState get initialState => Uninitialized();

  @override
  Stream<JobListState> mapEventToState(
    JobListEvent event,
  ) async* {
    if (event is LoadJobs) {
      yield* _mapLoadJobsToState();
    }
  }

  Stream<JobListState> _mapLoadJobsToState() async* {
    yield ListLoading();
    final List<Job> fetchJobs = await _jobsListRepository.fetchJobs();
    yield ListLoaded(fetchJobs);
  }
}
