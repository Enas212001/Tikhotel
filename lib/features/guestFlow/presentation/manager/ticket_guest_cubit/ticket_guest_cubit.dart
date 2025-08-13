import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/department_model/department_model.dart';
import 'package:ticket_flow/features/guestFlow/data/models/add_guest_ticket_model/add_guest_ticket_item.dart';
import 'package:ticket_flow/features/guestFlow/data/models/guest_ticket_model/guest_ticket_model.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_ticket_repo/ticket_guest_repo.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_ticket_repo/ticket_guest_repo_impl.dart';

part 'ticket_guest_state.dart';

class GuestTicketsCubit extends Cubit<GuestTicketsState> {
  GuestTicketsCubit() : super(TicketInitial());
  final TicketGuestRepo ticketGuestRepo = TicketGuestRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  Future<void> getGuestTicketsData() async {
    emit(TicketsGuestLoading());
    try {
      final result = await ticketGuestRepo.getGuestTicketsData(
        id: getIt.get<CacheHelper>().getData(key: CacheKey.guestId),
      );
      result.fold(
        (l) => emit(TicketsGuestFailure(message: l.failure.errorMessage)),
        (r) => emit(TicketsGuestSuccess(ticketModel: r)),
      );
    } on ServerFailure catch (e) {
      emit(TicketsGuestFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(TicketsGuestFailure(message: e.toString()));
    }
  }

  TextEditingController messageController = TextEditingController();
  DepartmentModel? departmentItem;
  Future<void> addGuestTicket() async {
    emit(AddGuestTicketLoading());
    try {
      final result = await ticketGuestRepo.addGuestTicket(
        message: messageController.text,
        departmentId: departmentItem!.id ?? 0,
        id: getIt.get<CacheHelper>().getData(key: CacheKey.guestId),
      );
      result.fold(
        (l) => emit(AddGuestTicketFailure(message: l.failure.errorMessage)),
        (r) => emit(AddGuestTicketSuccess(addTicketItem: r)),
      );
    } on ServerFailure catch (e) {
      emit(AddGuestTicketFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(AddGuestTicketFailure(message: e.toString()));
    }
  }

  TextEditingController replyController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  Future<void> addGuestReply() async {
    emit(AddGuestReplyLoading());
    try {
      final result = await ticketGuestRepo.addGuestReply(
        reply: replyController.text,
        rating: int.parse(ratingController.text),
        id: getIt.get<CacheHelper>().getData(key: CacheKey.guestId),
      );
      result.fold(
        (l) => emit(AddGuestReplyFailure(message: l.failure.errorMessage)),
        (r) => emit(AddGuestReplySuccess(message: r)),
      );
    } on ServerFailure catch (e) {
      emit(AddGuestReplyFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(AddGuestReplyFailure(message: e.toString()));
    }
  }
}
