part of 'ticket_guest_cubit.dart';

sealed class GuestTicketsState extends Equatable {
  const GuestTicketsState();

  @override
  List<Object> get props => [];
}

final class TicketInitial extends GuestTicketsState {}

final class TicketsGuestLoading extends GuestTicketsState {}

final class TicketsGuestSuccess extends GuestTicketsState {
  final GuestTicketModel ticketModel;
  const TicketsGuestSuccess({required this.ticketModel});
}

final class TicketsGuestFailure extends GuestTicketsState {
  final String message;
  const TicketsGuestFailure({required this.message});
}

final class AddGuestTicketLoading extends GuestTicketsState {}

final class AddGuestTicketSuccess extends GuestTicketsState {
  final AddGuestTicketItem addTicketItem;
  const AddGuestTicketSuccess({required this.addTicketItem});
}

final class AddGuestTicketFailure extends GuestTicketsState {
  final String message;
  const AddGuestTicketFailure({required this.message});
}

final class AddGuestReplyLoading extends GuestTicketsState {}

final class AddGuestReplySuccess extends GuestTicketsState {
  final String message;
  const AddGuestReplySuccess({required this.message});
}

final class AddGuestReplyFailure extends GuestTicketsState {
  final String message;
  const AddGuestReplyFailure({required this.message});
}
