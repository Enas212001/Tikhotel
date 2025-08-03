import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guest_login_model.dart';

import '../models/login_model/login_model.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, LoginModel>> adminLogin({
    required String email,
    required String password,
  });
  Future<Either<ServerFailure, GuestLoginModel>> guestLogin({
    required String roomNumber,
    required String firstName,
  });
  Future<Either<ServerFailure, bool>> logout();
}
