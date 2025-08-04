import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guest_login_model.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';

abstract class GuestFlowRepo {
  Future<Either<ServerFailure, GuestLoginModel>> guestLogin({
    required String roomNumber,
    required String firstName,
  });
  Future<Either<ServerFailure, GuestModel>> updateGuest(
    String id, {
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? cellPhone,
  });
  Future<Either<ServerFailure, bool>> logoutGuest();
}
