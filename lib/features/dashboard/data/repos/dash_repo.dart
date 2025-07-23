import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/features/dashboard/data/models/dashboard_model/dashboard_model.dart';
import 'package:ticket_flow/generated/l10n.dart';

abstract class DashRepo {
  Future<Either<ServerFailure, DashboardModel>> getDashboard();
}

class DashRepoImpl implements DashRepo {
  final ApiConsumer api;

  DashRepoImpl({required this.api});

  @override
  Future<Either<ServerFailure, DashboardModel>> getDashboard() async {
    try {
      final response = await api.get(EndPoints.dashboard);
      if (response is Map<String, dynamic>) {
        final dashboard = DashboardModel.fromJson(response);
        return right(dashboard);
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
}
