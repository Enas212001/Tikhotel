import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/guestFlow/data/models/add_guest_ticket_model/add_guest_ticket_item.dart';
import 'package:ticket_flow/features/guestFlow/data/models/guest_ticket_model/guest_ticket_model.dart';

abstract class TicketGuestRepo {
  Future<Either<ServerFailure, AddGuestTicketItem>> addGuestTicket({
    required String message,
    required int departmentId,
    required String id,
  });
  Future<Either<ServerFailure, GuestTicketModel>> getGuestTicketsData({
    required String id,
  });
  Future<Either<ServerFailure, String>> addGuestReply({
    required String reply,
    required int rating,
    required String id,
  });
}
