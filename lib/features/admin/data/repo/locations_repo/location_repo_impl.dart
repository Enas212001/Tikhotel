import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';

import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'location_repo.dart';

class LocationRepoImpl extends LocationRepo {
  final ApiConsumer api;

  LocationRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, LocationItem>> addLocation({
    required String name,
    required String status,
  }) async {
    try {
      final response = await api.post(
        EndPoints.addLocation,
        data: {ApiKey.location: name, ApiKey.status: status},
      );

      if (response is Map<String, dynamic> && response['data'] != null) {
        final location = LocationItem.fromJson(response['data']);
        return right(location);
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
  Future<Either<ServerFailure, String>> deleteLocation(String id) async {
    try {
      final response = await api.delete(EndPoints.deleteLocation(id));
      if (response is Map<String, dynamic>) {
        if (response['status'] == true) {
          return Right(response['message'] ?? S.current.locationDeleted);
        } else {
          return Left(
            ServerFailure(
              failure: FailureModel(
                errorMessage:
                    response['message'] ?? S.current.anUnexpectedErrorOccurred,
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
  Future<Either<ServerFailure, LocationItem>> editLocation(
    String id, {
    required String name,
    required String status,
  }) async {
    try {
      final response = await api.put(
        EndPoints.editLocation(id),
        data: {ApiKey.location: name, ApiKey.status: status},
      );
      if (response is Map<String, dynamic> && response['data'] != null) {
        final location = LocationItem.fromJson(response['data']);
        return right(location);
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
  Future<Either<ServerFailure, List<LocationItem>>> getLocations() async {
    try {
      final response = await api.get(EndPoints.locations);
      if (response is Map<String, dynamic>) {
        final locations = (response['data'] as List)
            .map((e) => LocationItem.fromJson(e))
            .toList();
        return right(locations);
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
}
