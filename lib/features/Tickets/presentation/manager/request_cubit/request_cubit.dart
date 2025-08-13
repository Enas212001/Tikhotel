import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/request_repo/request_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/request_repo/request_repo_impl.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());
  final RequestRepo ticketsRepo = RequestRepoImpl(
    ticketsRepo: TicketsRepoImpl(api: getIt.get<DioConsumer>()),
  );

  // @override
  // bool filterItem(TicketItem ticket, String filter) {
  //   switch (filter) {
  //     case 'new':
  //       return ticket.status == 'New';
  //     case 'accepted':
  //       return ticket.status == 'InProgress';
  //     default:
  //       return true;
  //   }
  // }

  // @override
  // bool searchItem(TicketItem ticket, String query) {
  //   final name =
  //       '${ticket.locationName ?? ''} ${ticket.problemTopic ?? ''}${ticket.departmentName ?? ''}${ticket.workerFname ?? ''}';
  //   final queryLower = query.toLowerCase();
  //   return name.contains(queryLower);
  // }

  // @override
  // void emitFilteredState(List<TicketItem> filteredItems) {
  //   if (state is RequestSuccess) {
  //     final currentState = state as RequestSuccess;
  //     emit(
  //       RequestSuccess(
  //         tickets: filteredItems,
  //         pagination: currentState.pagination,
  //       ),
  //     );
  //   }
  // }

  // void filterTickets(String filter) {
  //   filterItems(filter);
  // }

  int requestsPage = 1;

  final int limit = 20;
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
        allRequestsTickets = response.data!;
        emit(
          RequestSuccess(
            tickets: TicketModel(
              data: allRequestsTickets,
              pagination: response.pagination!,
            ),
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
          tickets: TicketModel(
            data: allRequestsTickets,
            pagination: currentState.tickets.pagination!,
          ),
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
      RequestSuccess(
        tickets: TicketModel(
          data: filtered,
          pagination: currentState.tickets.pagination!,
        ),
      ),
    );
  }

  void filterRequestsTickets(String filter) {
    if (state is! RequestSuccess) return;
    final currentState = state as RequestSuccess;

    List<TicketItem> filtered;
    switch (filter) {
      case 'new':
        filtered = allRequestsTickets
            .where((ticket) => ticket.status == 'New')
            .toList();
        break;
      case 'accepted':
        filtered = allRequestsTickets
            .where((ticket) => ticket.status == 'InProgress')
            .toList();
        break;
      default:
        filtered = allRequestsTickets;
    }

    emit(
      RequestSuccess(
        tickets: TicketModel(
          data: filtered,
          pagination: currentState.tickets.pagination!,
        ),
      ),
    );
  }
}
