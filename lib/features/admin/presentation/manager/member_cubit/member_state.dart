part of 'member_cubit.dart';

sealed class MemberState extends Equatable {
  const MemberState();

  @override
  List<Object> get props => [];
}

final class MemberInitial extends MemberState {}

final class MemberLoading extends MemberState {}

final class MemberLoaded extends MemberState {
  final MemberModel members;
  const MemberLoaded({required this.members});

  @override
  List<Object> get props => [members];
}

final class MemberError extends MemberState {
  final String message;
  const MemberError({required this.message});
}

final class MemberDeleted extends MemberState {
  final String message;
  const MemberDeleted({required this.message});
}

final class MemberDeleting extends MemberState {}

final class MemberDeletingError extends MemberState {
  final String error;
  const MemberDeletingError({required this.error});
}

final class MemberAdded extends MemberState {
  final MemberItem message;
  const MemberAdded({required this.message});
}

final class MemberAdding extends MemberState {}

final class MemberAddingError extends MemberState {
  final String error;
  const MemberAddingError({required this.error});
}

final class MemberEdited extends MemberState {
  final MemberItem message;
  const MemberEdited({required this.message});
}

final class MemberEditing extends MemberState {}

final class MemberEditingError extends MemberState {
  final String error;
  const MemberEditingError({required this.error});
}
