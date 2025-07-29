import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/topic_model/topic_item.dart';

abstract class TopicRepo {
  Future<Either<ServerFailure, List<TopicItem>>> getTopics({
    int page = 1,
    int limit = 20,
  });
  Future<Either<ServerFailure, TopicItem>> addTopic({
    required String topic,
    required String departmentId,
    required String sla,
  });
  Future<Either<ServerFailure, TopicItem>> editTopic(
    String id, {
    String topic,
    String departmentId,
    String sla,
  });
  Future<Either<ServerFailure, String>> deleteTopic(String id);
}
