import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/models/pagination_params.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/reply_model/replay_item.dart';

abstract class TicketsRepo {
  Future<Either<ServerFailure, dynamic>> getTickets([PaginationParams? params]);
  Future<Either<ServerFailure, dynamic>> getRequests([PaginationParams? params]);
  Future<Either<ServerFailure, dynamic>> getFeedbackTicketsData([PaginationParams? params]);
  Future<Either<ServerFailure, dynamic>> getClosedFeedbackTicketsData([PaginationParams? params]);
  Future<Either<ServerFailure, dynamic>> getClosedWorkOrderTicketsData([PaginationParams? params]);
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
