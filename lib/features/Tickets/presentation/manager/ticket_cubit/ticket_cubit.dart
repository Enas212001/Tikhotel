import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/add_ticket_model/add_ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/reply_model/replay_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_pagination.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_item.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_item.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());
  final TicketsRepo ticketsRepo = TicketsRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  int ticketsPage = 1;
  final int limit = 20;
  Future<void> fetchTickets({int? page}) async {
    ticketsPage = page ?? ticketsPage;
    emit(TicketLoading());
    final result = await ticketsRepo.getTickets(
      page: ticketsPage,
      limit: limit,
    );
    result.fold(
      (failure) => emit(TicketFailure(message: failure.failure.errorMessage)),
      (response) {
        if (ticketsPage == 1) {
          allTickets.clear();
        }
        allTickets.addAll(response.data!);
        emit(
          TicketSuccess(tickets: allTickets, pagination: response.pagination!),
        );
      },
    );
  }

  final List<TicketItem> allTickets = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  TextEditingController compensationController = TextEditingController();
  TextEditingController amountEgp = TextEditingController();
  DepartmentItem? selectedDepartment;
  final userId = getIt.get<CacheHelper>().getData(key: ApiKey.userId);
  WorkerItem? workerId;
  LocationItem? locationId;
  ProblemItem? problemId;
  int? quantity;
  final requesteddBy = getIt.get<CacheHelper>().getData(
    key: CacheKey.requestedBy,
  );
  RequestTypeItem? selectedRequestType;
  void setSelectedDepartment(BuildContext context, DepartmentItem? department) {
    if (selectedDepartment?.id != department?.id) {
      selectedDepartment = department;
      log(department!.name!);
      emit(TicketDepartmentChanged(department: department));
    }
  }

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

  String? selectedStatus;
  WorkerItem? workerIdEdit;
  ProblemItem? problemIdEdit;
  Future<void> editTicket(TicketItem ticket) async {
    emit(EditTicketLoading());
    final result = await ticketsRepo.editTicket(
      ticket.id!.toString(),
      status: selectedStatus ?? ticket.status,
      problemId: problemIdEdit!.id ?? ticket.problemId,
      workerId: workerIdEdit!.id ?? ticket.workerId,
    );
    result.fold(
      (failure) =>
          emit(EditTicketFailure(message: failure.failure.errorMessage)),
      (message) => emit(EditTicketSuccess(ticket: message)),
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
