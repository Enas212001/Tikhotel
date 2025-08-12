import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/reply_model/replay_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_pagination.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class TicketsRepoImpl implements TicketsRepo {
  final ApiConsumer api;

  TicketsRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, TicketsResponse>> getTickets({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await api.get(
        EndPoints.tickets,
        queryParameters: {ApiKey.page: page, ApiKey.limit: limit},
      );
      if (response is Map<String, dynamic>) {
        final tickets = (response['data'] as List)
            .map((e) => TicketItem.fromJson(e))
            .toList();

        final pagination = TicketPagination.fromJson(
          response['pagination'] ?? {},
        );
        return right(TicketsResponse(tickets: tickets, pagination: pagination));
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.noInternetConnection,
            ),
          ),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, TicketsResponse>> getFeedbackTicketsData({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.tickets
          .where((ticket) => ['Closed'].contains(ticket.status))
          .toList();
      return TicketsResponse(
        tickets: filtered,
        pagination: response.pagination,
      );
    });
  }

  @override
  Future<Either<ServerFailure, TicketsResponse>> getClosedFeedbackTicketsData({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.tickets
          .where(
            (ticket) => [
              'New',
              'InProgress',
              'Closed',
              'Closed with Feedback',
            ].contains(ticket.status),
          )
          .toList();
      return TicketsResponse(
        tickets: filtered,
        pagination: response.pagination,
      );
    });
  }

  @override
  Future<Either<ServerFailure, TicketsResponse>> getClosedWorkOrderTicketsData({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.tickets
          .where(
            (ticket) => [
              'New',
              'InProgress',
              'Closed',
              'Closed with work order',
            ].contains(ticket.status),
          )
          .toList();
      return TicketsResponse(
        tickets: filtered,
        pagination: response.pagination,
      );
    });
  }

  @override
  Future<Either<ServerFailure, TicketsResponse>> getRequests({
    int page = 1,
    int limit = 20,
  }) async {
    final result = await getTickets(page: page, limit: limit);
    return result.map((response) {
      final filtered = response.tickets
          .where(
            (ticket) => ['New', 'InProgress', 'Hold'].contains(ticket.status),
          )
          .toList();
      return TicketsResponse(
        tickets: filtered,
        pagination: response.pagination,
      );
    });
  }

  @override
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
  }) async {
    try {
      final response = await api.post(
        EndPoints.addTicket,
        data: {
          ApiKey.message: message,
          ApiKey.compensation: compensation,
          ApiKey.requestedBy: requestedBy,
          ApiKey.requestedUser: requestedUser,
          ApiKey.amountEgp: amountEgp,
          ApiKey.departmentId: departmentId,
          ApiKey.workerId: workerId,
          ApiKey.locationId: locationId,
          ApiKey.quantity: quantity,
          ApiKey.userId: userId,
          ApiKey.problemId: problemId,
        },
      );

      if (response is Map<String, dynamic>) {
        final ticket = AddTicketItem.fromJson(response['data']);
        return right(ticket);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.noInternetConnection,
            ),
          ),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, AddTicketItem>> editTicket(
    String id, {
    String? status,
    int? problemId,
    int? workerId,
  }) async {
    final response = await api.put(
      EndPoints.editTicket(id),
      data: {
        ApiKey.status: status,
        ApiKey.problemId: problemId,
        ApiKey.workerId: workerId,
      },
    );
    if (response is Map<String, dynamic>) {
      final ticket = AddTicketItem.fromJson(response['data']);
      return right(ticket);
    } else {
      return left(
        ServerFailure(
          failure: FailureModel(
            status: false,
            errorMessage: S.current.noInternetConnection,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, ReplyItem>> addReply(
    String id, {
    required String replay,
    required int userId,
  }) async {
    try {
      final response = await api.post(
        EndPoints.replyMessage(id),
        data: {ApiKey.userId: userId, ApiKey.replay: replay},
      );
      if (response is Map<String, dynamic>) {
        final reply = ReplyItem.fromJson(response['data']);
        return right(reply);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.noInternetConnection,
            ),
          ),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }
}
