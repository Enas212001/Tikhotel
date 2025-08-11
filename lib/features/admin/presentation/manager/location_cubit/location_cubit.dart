import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_item.dart';
import 'package:ticket_flow/features/admin/data/models/location_model/location_model.dart';
import 'package:ticket_flow/features/admin/data/repo/locations_repo/location_repo.dart';
import 'package:ticket_flow/features/admin/data/repo/locations_repo/location_repo_impl.dart';
import 'package:ticket_flow/features/admin/presentation/manager/mixins/filterable_mixin.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState>
    with FilterableMixin<LocationItem> {
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
  final int limit = 20;
  int locationPage = 1;
  Future<void> getLocations({int? page}) async {
    emit(LocationsLoading());
    try {
      final locations = await locationRepo.getLocations(
        page: page ?? locationPage,
        limit: limit,
      );
      locations.fold(
        (l) => emit(LocationsLoadingError(message: l.failure.errorMessage)),
        (r) {
          if (locationPage == 1) {
            allLocations.clear();
          }
          allLocations.addAll(r.data!);
          allItems = allLocations;
          emit(
            LocationsLoaded(
              locations: LocationModel(
                data: allLocations,
                pagination: r.pagination,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(LocationsLoadingError(message: e.toString()));
    }
  }

  List<LocationItem> allLocations = [];

  @override
  bool filterItem(LocationItem location, String filter) {
    switch (filter) {
      case 'active':
        return location.status == 'T';
      case 'inactive':
        return location.status == 'F';
      default:
        return true;
    }
  }

  @override
  bool searchItem(LocationItem location, String query) {
    final name = location.location?.toLowerCase() ?? '';
    final queryLower = query.toLowerCase();
    return name.contains(queryLower);
  }

  @override
  void emitFilteredState(List<LocationItem> filteredItems) {
    if (state is LocationsLoaded) {
      final currentState = state as LocationsLoaded;
      emit(
        LocationsLoaded(
          locations: LocationModel(
            data: filteredItems,
            pagination: currentState.locations.pagination,
          ),
        ),
      );
    }
  }

  void searchLocation(String query) {
    searchItems(query);
  }

  void filterLocations(String filter) {
    filterItems(filter);
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
