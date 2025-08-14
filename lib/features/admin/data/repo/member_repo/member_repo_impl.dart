import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_item.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'member_repo.dart';

class MemberRepoImpl extends MemberRepo {
  final ApiConsumer api;

  MemberRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, MemberItem>> addMember({
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
        final member = MemberItem.fromJson(response['data']);
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
        final message = response['message'] ?? S.current.memberDeleted;
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
  Future<Either<ServerFailure, MemberItem>> editMember(
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
        final member = MemberItem.fromJson(response['data']);
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
  Future<Either<ServerFailure, MemberModel>> getMembers({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await api.get(
        EndPoints.members,
        queryParameters: {ApiKey.page: page, ApiKey.limit: limit},
      );
      if (response is Map<String, dynamic>) {
        final members = MemberModel.fromJson(response);
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
}
