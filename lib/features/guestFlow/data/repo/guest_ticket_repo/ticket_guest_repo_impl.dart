import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/guestFlow/data/models/add_guest_ticket_model/add_guest_ticket_item.dart';
import 'package:ticket_flow/features/guestFlow/data/models/guest_ticket_model/guest_ticket_model.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_ticket_repo/ticket_guest_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class TicketGuestRepoImpl implements TicketGuestRepo {
  final ApiConsumer api;

  TicketGuestRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, AddGuestTicketItem>> addGuestTicket({
    required String message,
    required int departmentId,
    required String id,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addGuestTicket(id),
        data: {ApiKey.message: message, ApiKey.departmentId: departmentId},
      );
      if (response['status'] == false) {
        final errorMessage = response['message'];
        return left(
          ServerFailure(
            failure: FailureModel(errorMessage: errorMessage, status: false),
          ),
        );
      }
      final ticket = AddGuestTicketItem.fromJson(response['data']);
      return right(ticket);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, GuestTicketModel>> getGuestTicketsData({
    required String id,
  }) async {
    try {
      final response = await api.get(EndPoints.getGuestTicketsData(id));
      if (response['status'] == false) {
        final errorMessage = response['message'];
        return left(
          ServerFailure(
            failure: FailureModel(errorMessage: errorMessage, status: false),
          ),
        );
      }
      final ticket = GuestTicketModel.fromJson(response);
      return right(ticket);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, String>> addGuestReply({
    required String reply,
    required int rating,
    required String id,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addGuestReply(id),
        data: {ApiKey.clientFeedback: reply, ApiKey.rating: rating},
      );
      if (response['status'] == false) {
        final errorMessage = response['message'];
        return left(
          ServerFailure(
            failure: FailureModel(errorMessage: errorMessage, status: false),
          ),
        );
      }
      return right(
        response['message'] ?? S.current.theReplayHasBeenAddedSuccessfully,
      );
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
