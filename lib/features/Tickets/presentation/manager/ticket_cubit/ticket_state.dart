part of 'ticket_cubit.dart';

sealed class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object> get props => [];
}

final class TicketInitial extends TicketState {}

final class TicketLoading extends TicketState {}

final class TicketSuccess extends TicketState {
  final List<TicketItem> tickets;
  final TicketPagination pagination;

  const TicketSuccess({required this.tickets, required this.pagination});

  @override
  List<Object> get props => [tickets, pagination];
}

final class TicketFailure extends TicketState {
  final String message;

  const TicketFailure({required this.message});
}

final class AddTicketLoading extends TicketState {}

final class ReplayMessageLoading extends TicketState {}

final class ReplayMessageSuccess extends TicketState {
  final ReplyItem reply;

  const ReplayMessageSuccess({required this.reply});
}

final class ReplayMessageFailure extends TicketState {
  final String message;

  const ReplayMessageFailure({required this.message});
}

final class AddTicketSuccess extends TicketState {
  final AddTicketItem ticket;
  const AddTicketSuccess({required this.ticket});
}

final class AddTicketFailure extends TicketState {
  final String message;
  const AddTicketFailure({required this.message});
}

final class EditTicketLoading extends TicketState {}

final class EditTicketSuccess extends TicketState {
  final AddTicketItem ticket;
  const EditTicketSuccess({required this.ticket});
}

final class EditTicketFailure extends TicketState {
  final String message;
  const EditTicketFailure({required this.message});
}

