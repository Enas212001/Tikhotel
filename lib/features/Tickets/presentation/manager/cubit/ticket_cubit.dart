import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/models/pagination_model.dart';
import 'package:ticket_flow/core/models/pagination_params.dart';
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

  // Pagination variables for feedback tickets
  int _currentFeedbackPage = 1;
  int _totalFeedbackPages = 1;
  String? _currentFeedbackSearch;
  bool _isFeedbackLoading = false;

  Future<void> fetchFeedbackTickets({String? search, int page = 1}) async {
    if (_isFeedbackLoading) return;
    
    _isFeedbackLoading = true;
    _currentFeedbackPage = page;
    _currentFeedbackSearch = search;
    
    emit(TicketFeedbackLoading());
    
    final params = PaginationParams(
      page: page,
      limit: 20,
      search: search,
    );
    
    final result = await ticketsRepo.getFeedbackTicketsData(params);
    result.fold(
      (failure) {
        _isFeedbackLoading = false;
        emit(TicketFeedbackFailure(message: failure.failure.errorMessage));
      },
      (data) {
        _isFeedbackLoading = false;
        if (data is PaginationModel<TicketItem>) {
          // Calculate total pages
          final total = data.pagination.total ?? 0;
          final limit = data.pagination.limit ?? 20;
          _totalFeedbackPages = (total / limit).ceil();
          
          emit(TicketFeedbackSuccess(
            tickets: data.data,
            currentPage: page,
            totalPages: _totalFeedbackPages,
            totalItems: total,
          ));
        } else if (data is List<TicketItem>) {
          // Fallback for non-paginated response
          _totalFeedbackPages = 1;
          emit(TicketFeedbackSuccess(
            tickets: data,
            currentPage: 1,
            totalPages: 1,
            totalItems: data.length,
          ));
        }
      },
    );
  }

  Future<void> goToFeedbackPage(int page) async {
    if (page < 1 || page > _totalFeedbackPages || page == _currentFeedbackPage) {
      return;
    }
    
    await fetchFeedbackTickets(
      search: _currentFeedbackSearch,
      page: page,
    );
  }

  List<TicketItem> allFeedBackTickets = [];
  void searchFeedBackTickets(String query) {
    // Use the paginated fetch method for search
    fetchFeedbackTickets(search: query.trim().isEmpty ? null : query);
  }

  // Closed Feedback Pagination Variables
  int _currentClosedFeedbackPage = 1;
  int _totalClosedFeedbackPages = 1;
  String? _currentClosedFeedbackSearch;
  bool _isClosedFeedbackLoading = false;

  Future<void> fetchClosedFeedbackTickets({String? search, int page = 1}) async {
    if (_isClosedFeedbackLoading) return;
    _isClosedFeedbackLoading = true;
    _currentClosedFeedbackPage = page;
    _currentClosedFeedbackSearch = search;
    emit(TicketClosedFeedbackLoading());
    final params = PaginationParams(page: page, limit: 20, search: search);
    final result = await ticketsRepo.getClosedFeedbackTicketsData(params);
    result.fold(
      (failure) {
        _isClosedFeedbackLoading = false;
        emit(TicketClosedFeedbackFailure(message: failure.failure.errorMessage));
      },
      (data) {
        _isClosedFeedbackLoading = false;
        if (data is PaginationModel<TicketItem>) {
          final total = data.pagination.total ?? 0;
          final limit = data.pagination.limit ?? 20;
          _totalClosedFeedbackPages = (total / limit).ceil();
          emit(TicketClosedFeedbackSuccess(
            tickets: data.data,
            currentPage: page,
            totalPages: _totalClosedFeedbackPages,
            totalItems: total,
          ));
        } else if (data is List<TicketItem>) {
          _totalClosedFeedbackPages = 1;
          emit(TicketClosedFeedbackSuccess(
            tickets: data,
            currentPage: 1,
            totalPages: 1,
            totalItems: data.length,
          ));
        }
      },
    );
  }

  Future<void> goToClosedFeedbackPage(int page) async {
    if (page < 1 || page > _totalClosedFeedbackPages || page == _currentClosedFeedbackPage) {
      return;
    }
    
    await fetchClosedFeedbackTickets(
      search: _currentClosedFeedbackSearch,
      page: page,
    );
  }

  List<TicketItem> allClosedFeedbackTickets = [];
  void searchClosedFeedbackTickets(String query) {
    // Use the paginated fetch method for search
    fetchClosedFeedbackTickets(search: query.trim().isEmpty ? null : query);
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
