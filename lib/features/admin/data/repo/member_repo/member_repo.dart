import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_item.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';

abstract class MemberRepo {
  Future<Either<ServerFailure, MemberModel>> getMembers({int page, int limit});
  Future<Either<ServerFailure, MemberItem>> addMember({
    required String title,
    required String name,
    required String email,
    required String status,
  });
  Future<Either<ServerFailure, MemberItem>> editMember(
    String id, {
    String? title,
    String? name,
    String? email,
    String? status,
  });
  Future<Either<ServerFailure, String>> deleteMember(String id);
}
