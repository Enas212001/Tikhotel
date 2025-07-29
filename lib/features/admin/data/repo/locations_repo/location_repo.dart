import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';

abstract class LocationRepo {
  Future<Either<ServerFailure, List<LocationItem>>> getLocations();
  Future<Either<ServerFailure, LocationItem>> addLocation({
    required String name,
    required String status,
  });
  Future<Either<ServerFailure, String>> deleteLocation(String id);
  Future<Either<ServerFailure, LocationItem>> editLocation(
    String id, {
    required String name,
    required String status,
  });
}
