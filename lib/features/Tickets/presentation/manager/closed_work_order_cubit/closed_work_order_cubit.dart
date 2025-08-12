import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'closed_work_order_state.dart';

class ClosedWorkOrderCubit extends Cubit<ClosedWorkOrderState> {
  ClosedWorkOrderCubit() : super(ClosedWorkOrderInitial());
}
