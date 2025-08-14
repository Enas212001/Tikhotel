import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user/user.dart';
import 'package:ticket_flow/features/admin/data/models/user/user_model.dart';

abstract class UserRepo {
  Future<Either<ServerFailure, User>> getUsers({int page, int limit});
  Future<Either<ServerFailure, UserModel>> addUser({
    required int roleId,
    required String email,
    required String password,
    required String firstName,
    required List<String> department,
    required String status,
    required String operational,
  });
  Future<Either<ServerFailure, UserModel>> editUser(
    String id, {
    int? roleId,
    String? email,
    String? password,
    String? firstName,
    List<String>? department,
    String? status,
  });
  Future<Either<ServerFailure, String>> deleteUser(String id);
  Future<Either<ServerFailure, List<RoleModel>>> getRoles();
}
