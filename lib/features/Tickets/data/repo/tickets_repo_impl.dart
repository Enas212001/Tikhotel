import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/models/pagination_model.dart';
import 'package:ticket_flow/core/models/pagination_params.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/reply_model/replay_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class TicketsRepoImpl implements TicketsRepo {
  final ApiConsumer api;

  TicketsRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, dynamic>> getTickets([PaginationParams? params]) async {
    try {
      final response = await api.get(
        EndPoints.tickets,
        queryParameters: params?.toQueryParams(),
      );
      if (response is Map<String, dynamic>) {
        if (params != null) {
          // Return paginated response
          final paginatedTickets = PaginationModel<TicketItem>.fromJson(
            response,
            (json) => TicketItem.fromJson(json),
          );
          return right(paginatedTickets);
        } else {
          // Return list for backward compatibility
          final tickets = (response['data'] as List)
              .map((e) => TicketItem.fromJson(e))
              .toList();
          return right(tickets);
        }
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
  Future<Either<ServerFailure, dynamic>>
  getFeedbackTicketsData([PaginationParams? params]) async {
    final result = await getTickets(params);
    return result.map(
      (data) {
        if (params != null && data is PaginationModel<TicketItem>) {
          // Return paginated filtered data for open/active feedback tickets
          return PaginationModel<TicketItem>(
            data: data.data
                .where((ticket) => !['Closed'].contains(ticket.status))
                .toList(),
            pagination: data.pagination,
          );
        } else if (data is List<TicketItem>) {
          // Return filtered list for backward compatibility - open/active tickets
          return data
              .where((ticket) => !['Closed'].contains(ticket.status))
              .toList();
        }
        return data;
      },
    );
  }

  @override
  Future<Either<ServerFailure, dynamic>>
  getClosedFeedbackTicketsData([PaginationParams? params]) async {
    final result = await getTickets(params);
    return result.map(
      (data) {
        if (params != null && data is PaginationModel<TicketItem>) {
          // Return paginated filtered data
          return PaginationModel<TicketItem>(
            data: data.data
                .where(
                  (ticket) => [
                    'New',
                    'InProgress',
                    'Closed',
                    'Closed with Feedback',
                  ].contains(ticket.status),
                )
                .toList(),
            pagination: data.pagination,
          );
        } else if (data is List<TicketItem>) {
          // Return filtered list for backward compatibility
          return data
              .where(
                (ticket) => [
                  'New',
                  'InProgress',
                  'Closed',
                  'Closed with Feedback',
                ].contains(ticket.status),
              )
              .toList();
        }
        return data;
      },
    );
  }

  @override
  Future<Either<ServerFailure, dynamic>>
  getClosedWorkOrderTicketsData([PaginationParams? params]) async {
    final result = await getTickets(params);
    return result.map(
      (data) {
        if (params != null && data is PaginationModel<TicketItem>) {
          // Return paginated filtered data
          return PaginationModel<TicketItem>(
            data: data.data
                .where(
                  (ticket) => [
                    'New',
                    'InProgress',
                    'Closed',
                    'Closed with work order',
                  ].contains(ticket.status),
                )
                .toList(),
            pagination: data.pagination,
          );
        } else if (data is List<TicketItem>) {
          // Return filtered list for backward compatibility
          return data
              .where(
                (ticket) => [
                  'New',
                  'InProgress',
                  'Closed',
                  'Closed with work order',
                ].contains(ticket.status),
              )
              .toList();
        }
        return data;
      },
    );
  }

  @override
  Future<Either<ServerFailure, dynamic>> getRequests([PaginationParams? params]) async {
    final result = await getTickets(params);
    return result.map(
      (data) {
        if (params != null && data is PaginationModel<TicketItem>) {
          // Return paginated filtered data
          return PaginationModel<TicketItem>(
            data: data.data
                .where(
                  (ticket) => ['New', 'InProgress', 'Hold'].contains(ticket.status),
                )
                .toList(),
            pagination: data.pagination,
          );
        } else if (data is List<TicketItem>) {
          // Return filtered list for backward compatibility
          return data
              .where(
                (ticket) => ['New', 'InProgress', 'Hold'].contains(ticket.status),
              )
              .toList();
        }
        return data;
      },
    );
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
    required String status,
    required int departmentId,
    required int workerId,
  }) async {
    final response = await api.put(
      EndPoints.editTicket(id),
      data: {
        ApiKey.status: status,
        ApiKey.departmentId: departmentId,
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
