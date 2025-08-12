part of 'request_cubit.dart';

sealed class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

final class RequestInitial extends RequestState {}
