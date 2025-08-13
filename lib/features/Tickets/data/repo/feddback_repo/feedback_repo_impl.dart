import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/feddback_repo/feedback_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';

class FeedbackRepoImpl extends FeedbackRepo {
  final TicketsRepo ticketsRepo;
  FeedbackRepoImpl({required this.ticketsRepo});
  @override
  Future<Either<ServerFailure, TicketModel>> getFeedbackTicketsData({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await ticketsRepo.getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.data!
          .where((ticket) => ['Closed'].contains(ticket.status))
          .toList();
      return TicketModel(data: filtered, pagination: response.pagination);
    });
  }
}
