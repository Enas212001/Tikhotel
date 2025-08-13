part of 'closed_work_order_cubit.dart';

sealed class ClosedWorkOrderState extends Equatable {
  const ClosedWorkOrderState();

  @override
  List<Object> get props => [];
}

final class ClosedWorkOrderInitial extends ClosedWorkOrderState {}

final class TicketClosedWorkOrderLoading extends ClosedWorkOrderState {}

final class TicketClosedWorkOrderSuccess extends ClosedWorkOrderState {
  final TicketModel tickets;

  const TicketClosedWorkOrderSuccess({required this.tickets});
  @override
  List<Object> get props => [tickets];
}

final class TicketClosedWorkOrderFailure extends ClosedWorkOrderState {
  final String message;

  const TicketClosedWorkOrderFailure({required this.message});
}
