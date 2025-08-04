import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guest_login_model.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_flow_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class GuestFlowRepoImpl implements GuestFlowRepo {
  final ApiConsumer api;

  GuestFlowRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, GuestLoginModel>> guestLogin({
    required String roomNumber,
    required String firstName,
  }) async {
    try {
      final response = await api.post(
        EndPoints.guestLogin,
        data: {ApiKey.roomNumber: roomNumber, ApiKey.firstName: firstName},
      );
      final user = GuestLoginModel.fromJson(response['data']);
      return right(user);
    } on ServerFailure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ServerFailure, GuestModel>> updateGuest(
    String id, {
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? cellPhone,
  }) async {
    try {
      final response = await api.put(
        EndPoints.updateGuest(id),
        data: {
          ApiKey.firstName: firstName,
          ApiKey.name: lastName,
          ApiKey.email: email,
          ApiKey.phone: phoneNumber,
          ApiKey.cellPhone: cellPhone,
        },
      );
      if (response is Map<String, dynamic>) {
        final guest = GuestModel.fromJson(response['data']);
        return right(guest);
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
      return left(e);
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(errorMessage: e.toString(), status: false),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, bool>> logoutGuest() async {
    try {
      await getIt
          .get<CacheHelper>()
          .clearData(); // or removeData(key: ApiKey.userId)
      return right(true);
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(
            status: false,
            errorMessage: S.current.somethingWentWrong,
          ),
        ),
      );
    }
  }
}
