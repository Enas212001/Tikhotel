part of 'report_cubit.dart';

sealed class ReportState extends Equatable {
  const ReportState();

  @override
  List<Object> get props => [];
}

final class ReportInitial extends ReportState {}

final class FetchReportByDateLoading extends ReportState {}

final class FetchReportByDateSuccess extends ReportState {
  final List<ReportItem> reports;
  const FetchReportByDateSuccess({required this.reports});
}

final class FetchReportByDateFailure extends ReportState {
  final String message;
  const FetchReportByDateFailure({required this.message});
}

final class FetchReportByRoomLoading extends ReportState {}

final class FetchReportByRoomSuccess extends ReportState {
  final List<ReportItem> reports;
  const FetchReportByRoomSuccess({required this.reports});
}

final class FetchReportByRoomFailure extends ReportState {
  final String message;
  const FetchReportByRoomFailure({required this.message});
}
