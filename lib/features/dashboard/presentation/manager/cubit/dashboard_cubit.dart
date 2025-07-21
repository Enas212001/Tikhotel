import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/dashboard/data/models/dashboard_model/dashboard_model.dart';
import 'package:ticket_flow/features/dashboard/data/repos/dash_repo.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  final DashRepo dashRepo = DashRepoImpl(api: getIt.get<DioConsumer>());
  Future<void> getDashboard() async {
    emit(DashboardLoading());
    final result = await dashRepo.getDashboard();
    result.fold(
      (failure) =>
          emit(DashboardFailure(message: failure.failure.errorMessage)),
      (dashboard) => emit(DashboardSuccess(dashboard: dashboard)),
    );
  }
}
