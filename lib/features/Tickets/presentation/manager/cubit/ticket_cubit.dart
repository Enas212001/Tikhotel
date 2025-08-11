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
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_pagination.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/worker_model/worker_item.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> with FilterableMixin<TicketItem> {
  TicketCubit() : super(TicketInitial());
  final TicketsRepo ticketsRepo = TicketsRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  // Pagination tracking for each type
  int ticketsPage = 1;
  int feedbackPage = 1;
  int closedFeedbackPage = 1;
  int closedWorkOrderPage = 1;
  int requestsPage = 1;

  final int limit = 20;

  // ✅ Normal Tickets
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
        allTickets.addAll(response.tickets);
        emit(
          TicketSuccess(tickets: allTickets, pagination: response.pagination),
        );
      },
    );
  }

  final List<TicketItem> allTickets = [];

  @override
  bool filterItem(TicketItem ticket, String filter) {
    switch (filter) {
      case 'new':
        return ticket.status == 'new';
      case 'accepted':
        return ticket.status == 'InProgress';
      default:
        return true;
    }
  }

  @override
  bool searchItem(TicketItem ticket, String query) {
    final name =
        '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}';
    final queryLower = query.toLowerCase();
    return name.contains(queryLower);
  }

  @override
  void emitFilteredState(List<TicketItem> filteredItems) {
    if (state is RequestSuccess) {
      final currentState = state as RequestSuccess;
      emit(
        RequestSuccess(
          tickets: filteredItems,
          pagination: currentState.pagination,
        ),
      );
    }
  }

  void filterTickets(String filter) {
    filterItems(filter);
  }
  // void searchTickets(String query) {
  //   if (state is! TicketSuccess) return;
  //   final currentState = state as TicketSuccess;

  //   if (query.trim().isEmpty) {
  //     emit(
  //       TicketSuccess(tickets: allTickets, pagination: currentState.pagination),
  //     );
  //     return;
  //   }

  //   final lowerQuery = query.toLowerCase();
  //   final filtered = allTickets.where((ticket) {
  //     final fullName =
  //         '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
  //             .toLowerCase();
  //     return fullName.contains(lowerQuery);
  //   }).toList();

  //   emit(TicketSuccess(tickets: filtered, pagination: currentState.pagination));
  // }

  Future<void> fetchFeedbackTickets({int? page}) async {
    feedbackPage = page ?? feedbackPage;
    emit(TicketFeedbackLoading());
    final result = await ticketsRepo.getFeedbackTicketsData(
      page: feedbackPage,
      limit: limit,
    );
    result.fold(
      (failure) =>
          emit(TicketFeedbackFailure(message: failure.failure.errorMessage)),
      (response) {
        allFeedBackTickets = response.tickets;
        emit(
          TicketFeedbackSuccess(
            tickets: response.tickets,
            pagination: response.pagination,
          ),
        );
      },
    );
  }

  List<TicketItem> allFeedBackTickets = [];
  void searchFeedBackTickets(String query) {
    if (state is! TicketFeedbackSuccess) return;
    final currentState = state as TicketFeedbackSuccess;

    if (query.trim().isEmpty) {
      emit(
        TicketFeedbackSuccess(
          tickets: allFeedBackTickets,
          pagination: currentState.pagination,
        ),
      );
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allFeedBackTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(
      TicketFeedbackSuccess(
        tickets: filtered,
        pagination: currentState.pagination,
      ),
    );
  }

  // ✅ Closed Feedback Tickets
  Future<void> fetchClosedFeedbackTickets({int? page}) async {
    closedFeedbackPage = page ?? closedFeedbackPage;
    emit(TicketClosedFeedbackLoading());
    final result = await ticketsRepo.getClosedFeedbackTicketsData(
      page: closedFeedbackPage,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        TicketClosedFeedbackFailure(message: failure.failure.errorMessage),
      ),
      (response) {
        allClosedFeedbackTickets = response.tickets;
        emit(
          TicketClosedFeedbackSuccess(
            tickets: response.tickets,
            pagination: response.pagination,
          ),
        );
      },
    );
  }

  List<TicketItem> allClosedFeedbackTickets = [];
  void searchClosedFeedbackTickets(String query) {
    if (state is! TicketClosedFeedbackSuccess) return;
    final currentState = state as TicketClosedFeedbackSuccess;

    if (query.trim().isEmpty) {
      emit(
        TicketClosedFeedbackSuccess(
          tickets: allClosedFeedbackTickets,
          pagination: currentState.pagination,
        ),
      );
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allClosedFeedbackTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(
      TicketClosedFeedbackSuccess(
        tickets: filtered,
        pagination: currentState.pagination,
      ),
    );
  }

  Future<void> fetchClosedWorkOrderTickets({int? page}) async {
    closedWorkOrderPage = page ?? closedWorkOrderPage;
    emit(TicketClosedWorkOrderLoading());
    final result = await ticketsRepo.getClosedWorkOrderTicketsData(
      page: closedWorkOrderPage,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        TicketClosedWorkOrderFailure(message: failure.failure.errorMessage),
      ),
      (response) {
        allClosedWorkOrderTickets = response.tickets;
        emit(
          TicketClosedWorkOrderSuccess(
            tickets: response.tickets,
            pagination: response.pagination,
          ),
        );
      },
    );
  }

  List<TicketItem> allClosedWorkOrderTickets = [];
  void searchClosedWorkOrderTickets(String query) {
    if (state is! TicketClosedWorkOrderSuccess) return;
    final currentState = state as TicketClosedWorkOrderSuccess;

    if (query.trim().isEmpty) {
      emit(
        TicketClosedWorkOrderSuccess(
          tickets: allClosedWorkOrderTickets,
          pagination: currentState.pagination,
        ),
      );
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allClosedWorkOrderTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(
      TicketClosedWorkOrderSuccess(
        tickets: filtered,
        pagination: currentState.pagination,
      ),
    );
  }

  // ✅ Requests
  Future<void> fetchRequests({int? page}) async {
    requestsPage = page ?? requestsPage;
    emit(RequestLoading());
    final result = await ticketsRepo.getRequests(
      page: requestsPage,
      limit: limit,
    );
    result.fold(
      (failure) => emit(RequestFailure(message: failure.failure.errorMessage)),
      (response) {
        allRequestsTickets = response.tickets;
        emit(
          RequestSuccess(
            tickets: response.tickets,
            pagination: response.pagination,
          ),
        );
      },
    );
  }

  List<TicketItem> allRequestsTickets = [];
  
  void searchRequestsTickets(String query) {
    if (state is! RequestSuccess) return;
    final currentState = state as RequestSuccess;

    if (query.trim().isEmpty) {
      emit(
        RequestSuccess(
          tickets: allRequestsTickets,
          pagination: currentState.pagination,
        ),
      );
      return;
    }

    final lowerQuery = query.toLowerCase();
    final filtered = allRequestsTickets.where((ticket) {
      final fullName =
          '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}'
              .toLowerCase();
      return fullName.contains(lowerQuery);
    }).toList();

    emit(
      RequestSuccess(tickets: filtered, pagination: currentState.pagination),
    );
  }

  void filterRequestsTickets(String filter) {
    if (state is! RequestSuccess) return;
    final currentState = state as RequestSuccess;

    List<TicketItem> filtered;
    switch (filter) {
      case 'new':
        filtered = allRequestsTickets.where((ticket) => ticket.status == 'new').toList();
        break;
      case 'accepted':
        filtered = allRequestsTickets.where((ticket) => ticket.status == 'InProgress').toList();
        break;
      default:
        filtered = allRequestsTickets;
    }

    emit(
      RequestSuccess(tickets: filtered, pagination: currentState.pagination),
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
