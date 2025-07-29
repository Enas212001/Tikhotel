import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/data/repo/locations_repo/location_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/locations_repo/location_repo_impl.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  final LocationRepo locationRepo = LocationRepoImpl(
    api: getIt.get<DioConsumer>(),
  );

  final GlobalKey<FormState> formAddLocationKey = GlobalKey<FormState>();
  final TextEditingController locationController = TextEditingController();
  String? selectedStatus;
  final TextEditingController locationEditedController =
      TextEditingController();
  String? selectedEditedStatus;

  Future<void> getLocations() async {
    emit(LocationsLoading());
    try {
      final locations = await locationRepo.getLocations();
      locations.fold(
        (l) => emit(LocationsLoadingError(message: l.failure.errorMessage)),
        (r) => emit(LocationsLoaded(locations: r)),
      );
    } catch (e) {
      emit(LocationsLoadingError(message: e.toString()));
    }
  }

  Future<void> addLocation() async {
    emit(AddLocationLoading());
    try {
      final location = await locationRepo.addLocation(
        name: locationController.text,
        status: selectedStatus ?? 'T',
      );
      location.fold(
        (l) => emit(AddLocationFailed(message: l.failure.errorMessage)),
        (r) => emit(AddLocationSuccess(location: r)),
      );
    } catch (e) {
      emit(AddLocationFailed(message: e.toString()));
    }
  }

  Future<void> deleteLocation({required String id}) async {
    emit(DeleteLocationLoading());
    try {
      final location = await locationRepo.deleteLocation(id);
      location.fold(
        (l) => emit(DeleteLocationFailure(message: l.failure.errorMessage)),
        (r) => emit(DeleteLocationSuccess(message: r)),
      );
    } catch (e) {
      emit(DeleteLocationFailure(message: e.toString()));
    }
  }

  Future<void> updateLocation({required String id}) async {
    emit(EditLocationLoading());
    try {
      final location = await locationRepo.editLocation(
        id,
        name: locationEditedController.text.isEmpty
            ? locationController.text
            : locationEditedController.text,
        status: selectedEditedStatus ?? selectedStatus ?? 'T',
      );
      location.fold(
        (l) => emit(EditLocationFailed(message: l.failure.errorMessage)),
        (r) => emit(EditLocationSuccess(location: r)),
      );
    } catch (e) {
      emit(EditLocationFailed(message: e.toString()));
    }
  }
}
