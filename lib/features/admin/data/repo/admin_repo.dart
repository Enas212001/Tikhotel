import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';

abstract class AdminRepo {
  Future<Either<ServerFailure, List<UserModel>>> getUsers();
  Future<Either<ServerFailure, UserModel>> addUser({
    required String role,
    required String roleId,
    required String email,
    required String password,
    required String firstName,
    required String department,
    required String status,
    required String operational,
  });
  Future<Either<ServerFailure, List<User>>> editUser(String id);
  Future<Either<ServerFailure, String>> deleteUser(String id);
  Future<Either<ServerFailure, List<RoleModel>>> getRoles();
}
