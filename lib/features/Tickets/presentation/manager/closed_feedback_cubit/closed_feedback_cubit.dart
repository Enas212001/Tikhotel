import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'closed_feedback_state.dart';

class ClosedFeedbackCubit extends Cubit<ClosedFeedbackState> {
  ClosedFeedbackCubit() : super(ClosedFeedbackInitial());
}
