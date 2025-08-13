import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';

abstract class ClosedFeedbackRepo {
  Future<Either<ServerFailure, TicketModel>> getClosedFeedbackTicketsData({
    int page,
    int limit,
  });
}
