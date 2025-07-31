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

  Future<void> fetchFeedbackTickets() async {
    emit(TicketFeedbackLoading());
    final result = await ticketsRepo.getFeedbackTicketsData();
    result.fold(
      (failure) =>
          emit(TicketFeedbackFailure(message: failure.failure.errorMessage)),
      (tickets) => emit(TicketFeedbackSuccess(tickets: tickets)),
    );
  }

  Future<void> fetchClosedFeedbackTickets() async {
    emit(TicketClosedFeedbackLoading());
    final result = await ticketsRepo.getClosedFeedbackTicketsData();
    result.fold(
      (failure) => emit(
        TicketClosedFeedbackFailure(message: failure.failure.errorMessage),
      ),
      (tickets) => emit(TicketClosedFeedbackSuccess(tickets: tickets)),
    );
  }

  Future<void> fetchClosedWorkOrderTickets() async {
    emit(TicketClosedWorkOrderLoading());
    final result = await ticketsRepo.getClosedWorkOrderTicketsData();
    result.fold(
      (failure) => emit(
        TicketClosedWorkOrderFailure(message: failure.failure.errorMessage),
      ),
      (tickets) => emit(TicketClosedWorkOrderSuccess(tickets: tickets)),
    );
  }

  Future<void> fetchRequests() async {
    emit(RequestLoading());
    final result = await ticketsRepo.getRequests();
    result.fold(
      (failure) => emit(RequestFailure(message: failure.failure.errorMessage)),
      (tickets) => emit(RequestSuccess(tickets: tickets)),
    );
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
