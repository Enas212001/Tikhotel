import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';

abstract class TicketGuestRepo {
  Future<Either<ServerFailure, AddTicketItem>> addGuestTicket({
    required String message,
    required int departmentId,
    required String id,
  });
  Future<Either<ServerFailure, TicketModel>> getGuestTicketsData({
    required String id,
  });
  Future<Either<ServerFailure, String>> addGuestReply({
    required String reply,
    required int rating,
    required String id,
  });
}
