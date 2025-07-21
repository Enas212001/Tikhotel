import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';
import 'package:ticket_flow/features/guest/data/repo/guest_repo.dart';
import 'package:ticket_flow/features/guest/data/repo/guest_repo_impl.dart';

part 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  GuestCubit() : super(GuestInitial());
  final GuestRepo repo = GuestRepoImpl(api: getIt.get<DioConsumer>());
  Future<void> fetchGuests() async {
    emit(GuestLoading());
    try {
      final result = await repo.fetchGuests();
      result.fold(
        (failure) => emit(GuestFailure(message: failure.failure.errorMessage)),
        (guests) => emit(GuestSuccess(guests: guests)),
      );
    } on ServerFailure catch (e) {
      emit(GuestFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(GuestFailure(message: e.toString()));
    }
  }
}
