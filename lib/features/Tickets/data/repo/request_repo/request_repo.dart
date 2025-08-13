import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';

abstract class RequestRepo {
    Future<Either<ServerFailure, TicketModel>> getRequests({
    int page,
    int limit,
  });
}