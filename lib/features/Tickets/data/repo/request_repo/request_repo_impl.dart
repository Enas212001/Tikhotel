import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/request_repo/request_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';

class RequestRepoImpl extends RequestRepo {
  final TicketsRepo ticketsRepo;

  RequestRepoImpl({required this.ticketsRepo});
  @override
  Future<Either<ServerFailure, TicketModel>> getRequests({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await ticketsRepo.getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.data!
          .where(
            (ticket) => ['New', 'InProgress', 'Hold'].contains(ticket.status),
          )
          .toList();
      return TicketModel(data: filtered, pagination: response.pagination);
    });
  }
}
