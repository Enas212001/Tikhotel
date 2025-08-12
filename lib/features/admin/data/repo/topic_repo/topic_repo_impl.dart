import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'topic_repo.dart';

class TopicRepoImpl extends TopicRepo {
  final ApiConsumer api;

  TopicRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, TopicModel>> getTopics({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await api.get(
        EndPoints.topics,
        queryParameters: {ApiKey.page: page, ApiKey.limit: limit},
      );

      if (response is Map<String, dynamic>) {
        final model = TopicModel.fromJson(response);
        return right(model);
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
    required String status,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addTopic,
        data: {
          ApiKey.topic: topic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
          ApiKey.status: status,
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
    String? status,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editTopic(id),
        data: {
          ApiKey.topic: topic,
          ApiKey.departmentId: departmentId,
          ApiKey.sla: sla,
          ApiKey.status: status,
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
        return right(response['message'] ?? S.current.topicDeleted);
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
