import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_model.dart';

abstract class TopicRepo {
  Future<Either<ServerFailure, TopicModel>> getTopics({
    int page = 1,
    int limit = 20,
  });
  Future<Either<ServerFailure, TopicItem>> addTopic({
    required String topic,
    required String departmentId,
    required String sla,
    required String status,
  });
  Future<Either<ServerFailure, TopicItem>> editTopic(
    String id, {
    String topic,
    String departmentId,
    String sla,
    String? status,
  });
  Future<Either<ServerFailure, String>> deleteTopic(String id);
}
