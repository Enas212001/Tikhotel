import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/member_model/member_model.dart';

abstract class MemberRepo {
  Future<Either<ServerFailure, List<MemberModel>>> getMembers();
  Future<Either<ServerFailure, MemberModel>> addMember({
    required String title,
    required String name,
    required String email,
    required String status,
  });
  Future<Either<ServerFailure, MemberModel>> editMember(
    String id, {
    String? title,
    String? name,
    String? email,
    String? status,
  });
  Future<Either<ServerFailure, String>> deleteMember(String id);
}
