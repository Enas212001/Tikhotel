import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guset_login.dart';
import 'package:ticket_flow/features/auth/data/models/login_model/login_model.dart';
import 'package:ticket_flow/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, LoginModel>> adminLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.adminLogin,
        data: {ApiKey.email: email, ApiKey.password: password},
      );
      final user = LoginModel.fromJson(response);

      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, GuestLogin>> guestLogin({
    required String roomNumber,
    required String firstName,
  }) async {
    try {
      final response = await api.post(
        EndPoints.guestLogin,
        data: {ApiKey.roomNumber: roomNumber, ApiKey.firstName: firstName},
      );
      final user = GuestLogin.fromJson(response);

      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }
}
