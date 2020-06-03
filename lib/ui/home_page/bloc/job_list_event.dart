part of 'job_list_bloc.dart';

abstract class JobListEvent extends Equatable {
  const JobListEvent();
  List<Object> get props => null;
}
class LoadJobs extends JobListEvent {}
