part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardLoading extends DashboardState {}

final class DashboardSuccess extends DashboardState {
  final DashboardModel dashboard;

  const DashboardSuccess({required this.dashboard});

  @override
  List<Object> get props => [dashboard];
}

final class DashboardFailure extends DashboardState {
  final String message;

  const DashboardFailure({required this.message});

  @override
  List<Object> get props => [message];
}
