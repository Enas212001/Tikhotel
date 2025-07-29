import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class TicketsRepoImpl implements TicketsRepo {
  final ApiConsumer api;

  TicketsRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, List<TicketItem>>> getTickets() async {
    try {
      final response = await api.get(EndPoints.tickets);
      if (response is Map<String, dynamic>) {
        final tickets = (response['data'] as List)
            .map((e) => TicketItem.fromJson(e))
            .toList();
        return right(tickets);
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
  Future<Either<ServerFailure, List<TicketItem>>>
  getFeedbackTicketsData() async {
    final result = await getTickets();
    return result.map(
      (allTickets) => allTickets
          .where((ticket) => ['Closed'].contains(ticket.status))
          .toList(),
    );
  }

  @override
  Future<Either<ServerFailure, List<TicketItem>>>
  getClosedFeedbackTicketsData() async {
    final result = await getTickets();
    return result.map(
      (allTickets) => allTickets
          .where(
            (ticket) => [
              'New',
              'InProgress',
              'Closed',
              'Closed with Feedback',
            ].contains(ticket.status),
          )
          .toList(),
    );
  }

  @override
  Future<Either<ServerFailure, List<TicketItem>>>
  getClosedWorkOrderTicketsData() async {
    final result = await getTickets();
    return result.map(
      (allTickets) => allTickets
          .where(
            (ticket) => [
              'New',
              'InProgress',
              'Closed',
              'Closed with work order',
            ].contains(ticket.status),
          )
          .toList(),
    );
  }

  @override
  Future<Either<ServerFailure, List<TicketItem>>> getRequests() async {
    final result = await getTickets();
    return result.map(
      (allTickets) => allTickets
          .where(
            (ticket) => ['New', 'InProgress', 'Hold'].contains(ticket.status),
          )
          .toList(),
    );
  }
}
