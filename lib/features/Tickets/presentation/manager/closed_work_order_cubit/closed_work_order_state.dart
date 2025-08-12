part of 'closed_work_order_cubit.dart';

sealed class ClosedWorkOrderState extends Equatable {
  const ClosedWorkOrderState();

  @override
  List<Object> get props => [];
}

final class ClosedWorkOrderInitial extends ClosedWorkOrderState {}
