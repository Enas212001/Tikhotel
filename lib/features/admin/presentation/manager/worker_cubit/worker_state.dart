part of 'worker_cubit.dart';

sealed class WorkerState extends Equatable {
  const WorkerState();

  @override
  List<Object> get props => [];
}

final class WorkerInitial extends WorkerState {}

final class WorkerWhatsappToggled extends WorkerState {
  final bool allowWhatsapp;
  const WorkerWhatsappToggled(this.allowWhatsapp);

  @override
  List<Object> get props => [allowWhatsapp]; // ✅ ensures Bloc sees it as new
}

final class FetchAllWorkerLoading extends WorkerState {}

final class FetchAllWorkerSuccess extends WorkerState {
  final List<WorkerItem> workers;
  const FetchAllWorkerSuccess({required this.workers});
  @override
  List<Object> get props => [workers];
}

final class FetchAllWorkerFailure extends WorkerState {
  final String message;
  const FetchAllWorkerFailure({required this.message});
}

final class FetchWorkerLoading extends WorkerState {}

final class FetchWorkerSuccess extends WorkerState {
  final WorkerModel workers;
  const FetchWorkerSuccess({required this.workers});
  @override
  List<Object> get props => [workers];
}

final class FetchWorkerFailure extends WorkerState {
  final String message;
  const FetchWorkerFailure({required this.message});
}

final class AddWorkerLoading extends WorkerState {}

final class AddWorkerSuccess extends WorkerState {
  final WorkerItem worker;
  const AddWorkerSuccess({required this.worker});
}

final class AddWorkerFailure extends WorkerState {
  final String message;
  const AddWorkerFailure({required this.message});
}

final class EditWorkerLoading extends WorkerState {}

final class EditWorkerSuccess extends WorkerState {
  final WorkerItem worker;
  const EditWorkerSuccess({required this.worker});
}

final class EditWorkerFailure extends WorkerState {
  final String message;
  const EditWorkerFailure({required this.message});
}

final class DeleteWorkerLoading extends WorkerState {}

final class DeleteWorkerSuccess extends WorkerState {
  final String message;
  const DeleteWorkerSuccess({required this.message});
}

final class DeleteWorkerFailure extends WorkerState {
  final String message;
  const DeleteWorkerFailure({required this.message});
}
