part of 'job_list_bloc.dart';

abstract class JobListState extends Equatable {
  const JobListState();
  @override
  List<Object> get props => [];
}

class Uninitialized extends JobListState {}

class ListLoading extends JobListState {}

class ListLoaded extends JobListState {
  final List<Job> jobList;

  const ListLoaded(this.jobList);

  @override
  List<Object> get props => [jobList];

  @override
  String toString() => 'ListLoaded { list: $jobList }';
}
