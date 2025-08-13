import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_item.dart';
import 'package:ticket_flow/features/Tickets/data/models/ticket_model/ticket_model.dart';
import 'package:ticket_flow/features/Tickets/data/repo/closed_work_repo/closed_work_order_repo.dart';
import 'package:ticket_flow/features/Tickets/data/repo/closed_work_repo/closed_work_order_repo_impl.dart';
import 'package:ticket_flow/features/Tickets/data/repo/tickets_repo_impl.dart';

part 'closed_work_order_state.dart';

class ClosedWorkOrderCubit extends Cubit<ClosedWorkOrderState> {
  ClosedWorkOrderCubit() : super(ClosedWorkOrderInitial());
  final ClosedWorkOrderRepo closedWorkOrderRepo = ClosedWorkOrderRepoImpl(
    ticketsRepo: TicketsRepoImpl(api: getIt.get<DioConsumer>()),
  );
  int closedWorkOrderPage = 1;
  final int limit = 20;
  Future<void> fetchClosedWorkOrderTickets({int? page}) async {
    closedWorkOrderPage = page ?? closedWorkOrderPage;
    emit(TicketClosedWorkOrderLoading());
    final result = await closedWorkOrderRepo.getClosedWorkOrderTicketsData(
      page: closedWorkOrderPage,
      limit: limit,
    );
    result.fold(
      (failure) => emit(
        TicketClosedWorkOrderFailure(message: failure.failure.errorMessage),
      ),
      (response) {
        allClosedWorkOrderTickets = response.data!;
        emit(
          TicketClosedWorkOrderSuccess(
            tickets: TicketModel(
              data: allClosedWorkOrderTickets,
              pagination: response.pagination,
            ),
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
          tickets: TicketModel(
            data: allClosedWorkOrderTickets,
            pagination: currentState.tickets.pagination,
          ),
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
        tickets: TicketModel(
          data: filtered,
          pagination: currentState.tickets.pagination,
        ),
      ),
    );
  }
}
