import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/tickets_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());
  final TicketsRepo ticketsRepo = TicketsRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  Future<void> fetchTickets() async {
    emit(TicketLoading());
    final result = await ticketsRepo.getTickets();
    result.fold(
      (failure) => emit(TicketFailure(message: failure.failure.errorMessage)),
      (tickets) => emit(TicketSuccess(tickets: tickets)),
    );
  }

  Future<void> fetchFeedbackTickets() async {
    emit(TicketFeedbackLoading());
    final result = await ticketsRepo.getFeedbackTicketsData();
    result.fold(
      (failure) =>
          emit(TicketFeedbackFailure(message: failure.failure.errorMessage)),
      (tickets) => emit(TicketFeedbackSuccess(tickets: tickets)),
    );
  }

  Future<void> fetchClosedFeedbackTickets() async {
    emit(TicketClosedFeedbackLoading());
    final result = await ticketsRepo.getClosedFeedbackTicketsData();
    result.fold(
      (failure) => emit(
        TicketClosedFeedbackFailure(message: failure.failure.errorMessage),
      ),
      (tickets) => emit(TicketClosedFeedbackSuccess(tickets: tickets)),
    );
  }

  Future<void> fetchClosedWorkOrderTickets() async {
    emit(TicketClosedWorkOrderLoading());
    final result = await ticketsRepo.getClosedWorkOrderTicketsData();
    result.fold(
      (failure) => emit(TicketClosedWorkOrderFailure(message: failure.failure.errorMessage)),
      (tickets) => emit(TicketClosedWorkOrderSuccess(tickets: tickets)),
    );
  }
}
