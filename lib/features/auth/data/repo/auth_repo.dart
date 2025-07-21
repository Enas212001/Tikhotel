import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guset_login.dart';

import '../models/login_model/login_model.dart';

abstract class AuthRepo {
  Future<Either<ServerFailure, LoginModel>> adminLogin({
    required String email,
    required String password,
  });
  Future<Either<ServerFailure, GuestLogin>> guestLogin({
    required String roomNumber,
    required String firstName,
  });
}
