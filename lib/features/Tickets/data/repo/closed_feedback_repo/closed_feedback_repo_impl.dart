import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/closed_feedback_repo/closed_feedback_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';

class ClosedFeedbackRepoImpl extends ClosedFeedbackRepo {
  final TicketsRepo ticketsRepo;

  ClosedFeedbackRepoImpl({required this.ticketsRepo});
  @override
  Future<Either<ServerFailure, TicketModel>> getClosedFeedbackTicketsData({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await ticketsRepo.getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.data!
          .where(
            (ticket) => [
              'New',
              'InProgress',
              'Closed',
              'Closed with Feedback',
            ].contains(ticket.status),
          )
          .toList();
      return TicketModel(data: filtered, pagination: response.pagination);
    });
  }
}
