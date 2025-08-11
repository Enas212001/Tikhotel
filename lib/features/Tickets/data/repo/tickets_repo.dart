import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/reply_model/replay_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_pagination.dart';

class TicketsResponse {
  final List<TicketItem> tickets;
  final TicketPagination pagination;

  TicketsResponse({required this.tickets, required this.pagination});
}

abstract class TicketsRepo {
  Future<Either<ServerFailure, TicketsResponse>> getTickets({
    int page,
    int limit,
  });
  Future<Either<ServerFailure, TicketsResponse>> getRequests({
    int page,
    int limit,
  });
  Future<Either<ServerFailure, TicketsResponse>> getFeedbackTicketsData({
    int page,
    int limit,
  });
  Future<Either<ServerFailure, TicketsResponse>> getClosedFeedbackTicketsData({
    int page,
    int limit,
  });
  Future<Either<ServerFailure, TicketsResponse>> getClosedWorkOrderTicketsData({
    int page,
    int limit,
  });

  Future<Either<ServerFailure, AddTicketItem>> addTicket({
    required String message,
    required String compensation,
    required String requestedBy,
    required String requestedUser,
    required String amountEgp,
    required int departmentId,
    required int workerId,
    required int locationId,
    required int quantity,
    required int userId,
    required int problemId,
  });
  Future<Either<ServerFailure, AddTicketItem>> editTicket(
    String id, {
    required String status,
    required int departmentId,
    required int workerId,
  });
  Future<Either<ServerFailure, ReplyItem>> addReply(
    String id, {
    required String replay,
    required int userId,
  });
}
