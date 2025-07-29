import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'user_repo.dart';

class UserRepoImpl extends UserRepo {
  final ApiConsumer api;

  UserRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, UserModel>> addUser({
    required int roleId,
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
          ApiKey.roleId: roleId,
          ApiKey.department: department,
          ApiKey.status: status,
          ApiKey.operational: operational,
        },
      );
      if (response is Map<String, dynamic>) {
        final user = UserModel.fromJson(response);
        return right(user);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, String>> deleteUser(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteUser(id));
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          return Right(response['message'] ?? S.current.userDeleted);
        } else {
          return Left(
            ServerFailure(
              failure: FailureModel(
                errorMessage:
                    response['message'] ?? S.current.anUnexpectedErrorOccurred,
                status: false,
              ),
            ),
          );
        }
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, UserModel>> editUser(
    String id, {
    int? roleId,
    String? email,
    String? password,
    String? firstName,
    String? department,
    String? status,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editUser(id),
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.name: firstName,
          ApiKey.roleId: roleId,
          ApiKey.department: department,
          ApiKey.status: status,
        },
      );
      if (response is Map<String, dynamic> && response['user'] != null) {
        final user = UserModel.fromJson(response['user']);
        return right(user);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, List<UserModel>>> getUsers() async {
    try {
      final response = await api.get(EndPoints.users);
      if (response is Map<String, dynamic>) {
        final users = (response['data'] as List)
            .map((e) => UserModel.fromJson(e))
            .toList();
        return right(users);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
            ),
          ),
        );
      }
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
      if (response is List) {
        final roles = response.map((e) => RoleModel.fromJson(e)).toList();
        return right(roles);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.anUnexpectedErrorOccurred,
            ),
          ),
        );
      }
    } catch (e) {
      return Left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }
}
