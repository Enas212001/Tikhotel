import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final ApiConsumer api;
  AdminRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, UserModel>> addUser({
    required String role,
    required String roleId,
    required String email,
    required String password,
    required String firstName,
    required String department,
    required String status,
    required String operational,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addUser,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.name: firstName,
          ApiKey.role: role,
          ApiKey.roleId: roleId,
          ApiKey.department: department,
          ApiKey.status: status,
          ApiKey.operational: operational,
        },
      );
      return Right(UserModel.fromJson(response['data']));
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, String>> deleteUser(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteUser(id));
      if (response['status'] == true) {
        return Right(response['message'] ?? 'User deleted');
      } else {
        return Left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: response['message'] ?? 'Unknown error',
              status: false,
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<User>>> editUser(String id) {
    // TODO: implement editUser
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerFailure, List<UserModel>>> getUsers() async {
    try {
      final response = await api.get(EndPoints.users);
      final users = (response['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return Right(users);
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<RoleModel>>> getRoles() async {
    try {
      final response = await api.get(EndPoints.roles);
      final roles = (response as List)
          .map((e) => RoleModel.fromJson(e))
          .toList();
      return Right(roles);
    } catch (e) {
      return Left(ServerFailure(failure: FailureModel(errorMessage: e.toString(), status: false)));
    }
  }
}
