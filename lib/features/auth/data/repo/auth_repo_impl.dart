import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/auth/data/models/login_model/login_model.dart';
import 'package:ticket_flow/features/auth/data/repo/auth_repo.dart';
import 'package:ticket_flow/generated/l10n.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiConsumer api;

  AuthRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, LoginModel>> adminLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoints.adminLogin,
        data: {ApiKey.email: email, ApiKey.password: password},
      );

      if (response is Map<String, dynamic>) {
        final user = LoginModel.fromJson(response);
        getIt.get<CacheHelper>().saveData(
          key: ApiKey.userId,
          value: user.user!.id,
        );
        return right(user);
      } else {
        return left(
          ServerFailure(
            failure: FailureModel(
              status: false,
              errorMessage: S.current.noInternetConnection,
            ),
          ),
        );
      }
    } on ServerFailure catch (e) {
      return left(e);
    }
  }


  @override
  Future<Either<ServerFailure, bool>> logout() async {
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
