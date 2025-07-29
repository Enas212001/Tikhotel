import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';

abstract class TicketsRepo {
  Future<Either<ServerFailure, List<TicketItem>>> getTickets();
  Future<Either<ServerFailure, List<TicketItem>>> getRequests();
  Future<Either<ServerFailure, List<TicketItem>>> getFeedbackTicketsData();
  Future<Either<ServerFailure, List<TicketItem>>>
  getClosedFeedbackTicketsData();
  Future<Either<ServerFailure, List<TicketItem>>>
  getClosedWorkOrderTicketsData();
}
