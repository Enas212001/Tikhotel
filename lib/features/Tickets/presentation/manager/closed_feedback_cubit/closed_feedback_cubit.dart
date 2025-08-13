import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/closed_feedback_repo/closed_feedback_repo_impl.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';

part 'closed_feedback_state.dart';

class ClosedFeedbackCubit extends Cubit<ClosedFeedbackState> {
  ClosedFeedbackCubit() : super(ClosedFeedbackInitial());
  final ClosedFeedbackRepoImpl closedFeedbackRepo = ClosedFeedbackRepoImpl(
    ticketsRepo: TicketsRepoImpl(api: getIt.get<DioConsumer>()),
  );
  int closedFeedbackPage = 1;
  final int limit = 20;
  // ✅ Closed Feedback Tickets
  Future<void> fetchClosedFeedbackTickets({int? page}) async {
    closedFeedbackPage = page ?? closedFeedbackPage;
    emit(TicketClosedFeedbackLoading());
    final result = await closedFeedbackRepo.getClosedFeedbackTicketsData(
      page: closedFeedbackPage,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        TicketClosedFeedbackFailure(message: failure.failure.errorMessage),
      ),
      (response) {
        allClosedFeedbackTickets = response.data!;
        emit(
          TicketClosedFeedbackSuccess(
            tickets: TicketModel(
              data: allClosedFeedbackTickets,
              pagination: response.pagination,
            ),
          ),
        );
      },
    );
  }

  List<TicketItem> allClosedFeedbackTickets = [];
  void searchClosedFeedbackTickets(String query) {
    if (state is! TicketClosedFeedbackSuccess) return;
    final currentState = state as TicketClosedFeedbackSuccess;

    if (query.trim().isEmpty) {
      emit(
        TicketClosedFeedbackSuccess(
          tickets: TicketModel(
            data: allClosedFeedbackTickets,
            pagination: currentState.tickets.pagination,
          ),
        ),
      );
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allClosedFeedbackTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(
      TicketClosedFeedbackSuccess(
        tickets: TicketModel(
          data: filtered,
          pagination: currentState.tickets.pagination,
        ),
      ),
    );
  }
}
