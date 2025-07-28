import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';
import 'package:ticket_flow/features/admin/data/models/problem_model/problem_item.dart';
import 'package:ticket_flow/features/admin/data/models/request_type_model/request_type_model.dart';
import 'package:ticket_flow/features/admin/data/models/role_model/role_model.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/user_model/user_model.dart';
import 'package:ticket_flow/features/admin/data/repo/admin_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class AdminRepoImpl implements AdminRepo {
  final ApiConsumer api;
  AdminRepoImpl({required this.api});
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

  @override
  Future<Either<ServerFailure, List<RequestTypeModel>>>
  getRequestTypes() async {
    try {
      final response = await api.get(EndPoints.requestTypes);
      if (response is List) {
        final requestTypes = response
            .map((e) => RequestTypeModel.fromJson(e))
            .toList();
        return right(requestTypes);
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
  Future<Either<ServerFailure, RequestTypeModel>> addRequestType({
    required String requestType,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addRequestType,
        data: {ApiKey.requestType: requestType},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final requestType = RequestTypeModel.fromJson(response['data']);
        return right(requestType);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, String>> deleteRequestType(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteRequestType(id));
      if (response is Map<String, dynamic>) {
        return right(response['message'] ?? 'Request type deleted');
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, RequestTypeModel>> editRequestType(
    String id, {
    required String requestType,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editRequestType(id),
        data: {ApiKey.requestType: requestType},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final requestType = RequestTypeModel.fromJson(response['data']);
        return right(requestType);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              errorMessage: S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, List<TopicItem>>> getTopics({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await api.get(
        "${EndPoints.topics}?page=$page&limit=$limit",
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problems = (response['data'] as List)
            .map((e) => TopicItem.fromJson(e))
            .toList();
        return right(problems);
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
  Future<Either<ServerFailure, TopicItem>> addTopic({
    required String topic,
    required String departmentId,
    required String sla,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addTopic,
        data: {
          ApiKey.topic: topic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problem = TopicItem.fromJson(response['data']);
        return right(problem);
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
  Future<Either<ServerFailure, TopicItem>> editTopic(
    String id, {
    String? topic,
    String? departmentId,
    String? sla,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editTopic(id),
        data: {
          ApiKey.topic: topic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problem = TopicItem.fromJson(response['data']);
        return right(problem);
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
  Future<Either<ServerFailure, String>> deleteTopic(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteTopic(id));
      if (response is Map<String, dynamic> && response['status'] == true) {
        return right(response['message'] ?? 'Problem deleted');
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
  Future<Either<ServerFailure, MemberModel>> addMember({
    required String title,
    required String name,
    required String email,
    required String status,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addMember,
        data: {
          ApiKey.title: title,
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.status: status,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final member = MemberModel.fromJson(response['data']);
        return right(member);
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
  Future<Either<ServerFailure, String>> deleteMember(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteMember(id));
      if (response is Map<String, dynamic>) {
        final message = response['message'] ?? 'Member deleted';
        return right(message);
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
  Future<Either<ServerFailure, MemberModel>> editMember(
    String id, {
    String? title,
    String? name,
    String? email,
    String? status,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editMember(id),
        data: {
          ApiKey.title: title,
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.status: status,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final member = MemberModel.fromJson(response['data']);
        return right(member);
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
  Future<Either<ServerFailure, List<MemberModel>>> getMembers() async {
    try {
      final response = await api.get(EndPoints.members);
      if (response is List) {
        final members = response.map((e) => MemberModel.fromJson(e)).toList();
        return right(members);
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
  Future<Either<ServerFailure, ProblemItem>> addProblem({
    required String problemTopic,
    required String departmentId,
    required String sla,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addProblem,
        data: {
          ApiKey.topic: problemTopic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problem = ProblemItem.fromJson(response['data']);
        return right(problem);
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
  Future<Either<ServerFailure, String>> deleteProblem(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteProblem(id));
      if (response is Map<String, dynamic>) {
        final message = response['message'] ?? 'Problem deleted';
        return right(message);
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
  Future<Either<ServerFailure, ProblemItem>> editProblem(
    String id, {
    String? problemTopic,
    String? departmentId,
    String? sla,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editProblem(id),
        data: {
          ApiKey.topic: problemTopic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
        },
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problem = ProblemItem.fromJson(response['data']);
        return right(problem);
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
  Future<Either<ServerFailure, List<ProblemItem>>> getProblems() async {
    try {
      final response = await api.get(EndPoints.problems);
      if (response is Map<String, dynamic> && response['data'] != null) {
        final problems = (response['data'] as List)
            .map((e) => ProblemItem.fromJson(e))
            .toList();
        return right(problems);
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
}
