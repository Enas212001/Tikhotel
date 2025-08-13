import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/feddback_repo/feedback_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/feddback_repo/feedback_repo_impl.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';

part 'feedback_state.dart';

class FeedbackCubit extends Cubit<FeedbackState> {
  FeedbackCubit() : super(FeedbackInitial());
  final FeedbackRepo feedbackRepo = FeedbackRepoImpl(
    ticketsRepo: TicketsRepoImpl(api: getIt.get<DioConsumer>()),
  );

  int feedbackPage = 1;
  final int limit = 20;
  Future<void> fetchFeedbackTickets({int? page}) async {
    feedbackPage = page ?? feedbackPage;
    emit(TicketFeedbackLoading());
    final result = await feedbackRepo.getFeedbackTicketsData(
      page: feedbackPage,
      limit: limit,
    );
    result.fold(
      (failure) =>
          emit(TicketFeedbackFailure(message: failure.failure.errorMessage)),
      (response) {
        allFeedBackTickets = response.data!;
        emit(
          TicketFeedbackSuccess(
            tickets: TicketModel(
              data: allFeedBackTickets,
              pagination: response.pagination,
            ),
          ),
        );
      },
    );
  }

  List<TicketItem> allFeedBackTickets = [];
  void searchFeedBackTickets(String query) {
    if (state is! TicketFeedbackSuccess) return;
    final currentState = state as TicketFeedbackSuccess;

    if (query.trim().isEmpty) {
      emit(TicketFeedbackSuccess(tickets: TicketModel()));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allFeedBackTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(
      TicketFeedbackSuccess(
        tickets: TicketModel(
          data: filtered,
          pagination: currentState.tickets.pagination,
        ),
      ),
    );
  }
}
