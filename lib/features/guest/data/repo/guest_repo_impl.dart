import 'package:dartz/dartz.dart';
import 'package:ticket_flow/core/api/api_consumer.dart';
import 'package:ticket_flow/core/utils/api_key.dart';

import 'package:ticket_flow/core/error/server_failure.dart';

import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';

import 'guest_repo.dart';

class GuestRepoImpl extends GuestRepo {
  final ApiConsumer api;
  GuestRepoImpl({required this.api});
  @override
  Future<Either<ServerFailure, List<GuestModel>>> fetchGuests() async {
    try {
      final response = await api.get(EndPoints.guests);
      final guests = (response as List)
          .map((e) => GuestModel.fromJson(e))
          .toList();
      return right(guests);
    } on ServerFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(
        ServerFailure(
          failure: FailureModel(status: false, errorMessage: e.toString()),
        ),
      );
    }
  }
}
