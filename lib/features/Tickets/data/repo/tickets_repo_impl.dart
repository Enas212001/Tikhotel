import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/Tickets/data/models/tickets_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';

class TicketsRepoImpl implements TicketsRepo {
  final ApiConsumer api;

  TicketsRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, List<Datum>>> getTickets() async {
    try {
      final response = await api.get(EndPoints.tickets);
      final tickets = (response['data'] as List)
          .map((e) => Datum.fromJson(e))
          .toList();
      return right(tickets);
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }
@override
  Future<Either<ServerFailure, List<Datum>>> getFeedbackTicketsData() async {
    final result = await getTickets();
    return result.map(
      (allTickets) => allTickets
          .where(
            (ticket) => [
              'New',
              'InProgress',
              'Closed',
              'Hold',
              'Closed with Feedback',
            ].contains(ticket.status),
          )
          .toList(),
    );
  }

  @override
  Future<Either<ServerFailure, List<Datum>>>
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
  Future<Either<ServerFailure, List<Datum>>>
  getClosedWorkOrderTicketsData() async {
    final result = await getTickets();
    return result.map(
      (allTickets) => allTickets
          .where(
            (ticket) => ['New', 'InProgress', 'Closed'].contains(ticket.status),
          )
          .toList(),
    );
  }
}
