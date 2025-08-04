import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/reply_model/replay_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/datum.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());
  final TicketsRepo ticketsRepo = TicketsRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  Future<void> fetchTickets() async {
    emit(TicketLoading());
    final result = await ticketsRepo.getTickets();
    result.fold(
      (failure) => emit(TicketFailure(message: failure.failure.errorMessage)),
      (tickets) => emit(TicketSuccess(tickets: tickets)),
    );
  }

  final List<TicketItem> allTickets = [];
  void searchTickets(String query) {
    if (state is! TicketSuccess) return;

    if (query.trim().isEmpty) {
      emit(TicketSuccess(tickets: allTickets));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(TicketSuccess(tickets: filtered));
  }

  Future<void> fetchFeedbackTickets() async {
    emit(TicketFeedbackLoading());
    final result = await ticketsRepo.getFeedbackTicketsData();
    result.fold(
      (failure) =>
          emit(TicketFeedbackFailure(message: failure.failure.errorMessage)),
      (tickets) {
        allFeedBackTickets = tickets;
        emit(TicketFeedbackSuccess(tickets: tickets));
      },
    );
  }

  List<TicketItem> allFeedBackTickets = [];
  void searchFeedBackTickets(String query) {
    if (state is! TicketFeedbackSuccess) return;

    if (query.trim().isEmpty) {
      emit(TicketFeedbackSuccess(tickets: allFeedBackTickets));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allFeedBackTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(TicketFeedbackSuccess(tickets: filtered));
  }

  Future<void> fetchClosedFeedbackTickets() async {
    emit(TicketClosedFeedbackLoading());
    final result = await ticketsRepo.getClosedFeedbackTicketsData();
    result.fold(
      (failure) => emit(
        TicketClosedFeedbackFailure(message: failure.failure.errorMessage),
      ),
      (tickets) {
        allClosedFeedbackTickets = tickets;
        emit(TicketClosedFeedbackSuccess(tickets: tickets));
      },
    );
  }

  List<TicketItem> allClosedFeedbackTickets = [];
  void searchClosedFeedbackTickets(String query) {
    if (state is! TicketClosedFeedbackSuccess) return;

    if (query.trim().isEmpty) {
      emit(TicketClosedFeedbackSuccess(tickets: allClosedFeedbackTickets));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allClosedFeedbackTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(TicketClosedFeedbackSuccess(tickets: filtered));
  }

  Future<void> fetchClosedWorkOrderTickets() async {
    emit(TicketClosedWorkOrderLoading());
    final result = await ticketsRepo.getClosedWorkOrderTicketsData();
    result.fold(
      (failure) => emit(
        TicketClosedWorkOrderFailure(message: failure.failure.errorMessage),
      ),
      (tickets) {
        allClosedWorkOrderTickets = tickets;
        emit(TicketClosedWorkOrderSuccess(tickets: tickets));
      },
    );
  }

  List<TicketItem> allClosedWorkOrderTickets = [];
  void searchClosedWorkOrderTickets(String query) {
    if (state is! TicketClosedWorkOrderSuccess) return;

    if (query.trim().isEmpty) {
      emit(TicketClosedWorkOrderSuccess(tickets: allClosedWorkOrderTickets));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allClosedWorkOrderTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(TicketClosedWorkOrderSuccess(tickets: filtered));
  }

  Future<void> fetchRequests() async {
    emit(RequestLoading());
    final result = await ticketsRepo.getRequests();
    result.fold(
      (failure) => emit(RequestFailure(message: failure.failure.errorMessage)),
      (tickets) {
        allRequestsTickets = tickets;
        emit(RequestSuccess(tickets: tickets));
      },
    );
  }

  List<TicketItem> allRequestsTickets = [];
  void searchRequestsTickets(String query) {
    if (state is! RequestSuccess) return;

    if (query.trim().isEmpty) {
      emit(RequestSuccess(tickets: allRequestsTickets));
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allRequestsTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(RequestSuccess(tickets: filtered));
  }

  TextEditingController messageController = TextEditingController();
  TextEditingController compensationController = TextEditingController();
  TextEditingController amountEgp = TextEditingController();
  DepartmentModel? selectedDepartment;
  final userId = getIt.get<CacheHelper>().getData(key: ApiKey.userId);
  WorkerItem? workerId;
  LocationItem? locationId;
  TopicItem? problemId;
  int? quantity;
  final requesteddBy = getIt.get<CacheHelper>().getData(
    key: CacheKey.requestedBy,
  );
  RequestTypeModel? selectedRequestType;
  Future<void> addTicket() async {
    emit(AddTicketLoading());
    final result = await ticketsRepo.addTicket(
      message: messageController.text,
      compensation: compensationController.text,
      requestedBy: requesteddBy,
      requestedUser: selectedDepartment!.name!,
      amountEgp: amountEgp.text,
      departmentId: selectedDepartment!.id!,
      workerId: workerId!.id!,
      locationId: locationId!.id!,
      quantity: quantity ?? 0,
      userId: userId,
      problemId: problemId!.id!,
    );
    result.fold(
      (failure) =>
          emit(AddTicketFailure(message: failure.failure.errorMessage)),
      (message) => emit(AddTicketSuccess(ticket: message)),
    );
  }

  TextEditingController replayController = TextEditingController();
  Future<void> addreplay(String id) async {
    emit(ReplayMessageLoading());
    final result = await ticketsRepo.addReply(
      id,
      replay: replayController.text,
      userId: userId,
    );
    result.fold(
      (failure) =>
          emit(ReplayMessageFailure(message: failure.failure.errorMessage)),
      (message) => emit(ReplayMessageSuccess(reply: message)),
    );
  }
}
