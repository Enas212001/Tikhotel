import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/tickets_model/datum.dart';

abstract class TicketsRepo {
  Future<Either<ServerFailure, List<Datum>>> getTickets();
  Future<Either<ServerFailure, List<Datum>>> getFeedbackTicketsData();
  Future<Either<ServerFailure, List<Datum>>> getClosedFeedbackTicketsData();
  Future<Either<ServerFailure, List<Datum>>> getClosedWorkOrderTicketsData();
}
