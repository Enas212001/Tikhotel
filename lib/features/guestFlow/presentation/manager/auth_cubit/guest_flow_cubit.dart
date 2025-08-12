import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guest_login_model.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_flow_repo.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_flow_repo_impl.dart';

part 'guest_flow_state.dart';

class GuestFlowCubit extends Cubit<GuestFlowState> {
  GuestFlowCubit() : super(GuestFlowInitial()) {
    _loadGuestData();
  }

  final GuestFlowRepo guestFlowRepo = GuestFlowRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  final CacheHelper _cacheHelper = getIt.get<CacheHelper>();

  GlobalKey<FormState> guestLoginKey = GlobalKey<FormState>();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  GuestLoginModel? loggedInGuest;
  bool _controllersInitialized = false;

  // Load guest data from cache on initialization
  Future<void> _loadGuestData() async {
    try {
      log('Attempting to load guest data from cache...');
      final guestDataString = _cacheHelper.getDataString(
        key: CacheKey.guestData,
      );
      log('Guest data string from cache: $guestDataString');

      if (guestDataString != null) {
        final guestData = jsonDecode(guestDataString);
        loggedInGuest = GuestLoginModel.fromJson(guestData);
        log(
          'Successfully loaded guest data from cache: ${loggedInGuest.toString()}',
        );
      } else {
        log('No guest data found in cache');
      }
    } catch (e) {
      log('Error loading guest data from cache: $e');
    }
  }

  // Save guest data to cache
  Future<void> _saveGuestData(GuestLoginModel guest) async {
    try {
      log('Saving guest data to cache: ${guest.toString()}');
      final guestDataString = jsonEncode(guest.toJson());
      log('Guest data JSON string: $guestDataString');

      await _cacheHelper.saveData(
        key: CacheKey.guestData,
        value: guestDataString,
      );
      await _cacheHelper.saveData(key: CacheKey.guestLoggedIn, value: true);
      log('Successfully saved guest data to cache');
    } catch (e) {
      log('Error saving guest data to cache: $e');
    }
  }

  // Initialize profile controllers with guest data
  void initializeProfileControllers() {
    if (!_controllersInitialized && loggedInGuest != null) {
      fNameController.text = loggedInGuest!.fname ?? '';
      lastNameController.text = loggedInGuest!.name ?? '';
      emailController.text = loggedInGuest!.email?.toString() ?? '';
      phoneNumberController.text = loggedInGuest!.phone?.toString() ?? '';
      cellPhoneController.text = loggedInGuest!.cellPhone?.toString() ?? '';
      _controllersInitialized = true;
    }
  }

  Future<void> guestLogin() async {
    emit(GuestLoginLoading());
    try {
      final result = await guestFlowRepo.guestLogin(
        roomNumber: roomNumberController.text,
        firstName: firstNameController.text,
      );
      result.fold(
        (failure) =>
            emit(GuestLoginFailure(message: failure.failure.errorMessage)),
        (guestLogin) async {
          loggedInGuest = guestLogin;
          await _saveGuestData(guestLogin);
          emit(GuestLoginSuccess(gusetLogin: guestLogin));
        },
      );
    } on ServerFailure catch (e) {
      emit(GuestLoginFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(GuestLoginFailure(message: e.toString()));
    }
  }

  TextEditingController fNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cellPhoneController = TextEditingController();
  String? country;
  Future<void> updateGuest(GuestModel guestModel) async {

    emit(UpdateGuestLoading());
    final result = await guestFlowRepo.updateGuest(
      guestModel.id.toString(),
      firstName: fNameController.text.isNotEmpty
          ? fNameController.text
          : guestModel.fname,
      lastName: lastNameController.text.isNotEmpty
          ? lastNameController.text
          : guestModel.name,
      email: emailController.text.isNotEmpty
          ? emailController.text
          : guestModel.email,
      phoneNumber: phoneNumberController.text.isNotEmpty
          ? phoneNumberController.text
          : guestModel.phone,
      cellPhone: cellPhoneController.text.isNotEmpty
          ? cellPhoneController.text
          : guestModel.cellPhone,
    );
    result.fold(
      (l) => emit(UpdateGuestFailure(message: l.failure.errorMessage)),
      (r) async {
        // Update the logged in guest data with the API response data
        if (loggedInGuest != null) {
          // Convert the updated GuestModel back to GuestLoginModel
          loggedInGuest = GuestLoginModel(
            id: r.id,
            fname: r.fname,
            name: r.name,
            room: r.room,
            roomStatus: r.roomStatus,
            beginDate: r.beginDate,
            endDate: r.endDate,
            email: r.email,
            vip: r.vip,
            countryId: r.countryId,
            phone: r.phone,
            status: r.status,
            cellPhone: r.cellPhone,
          );

          // Update the controllers with the new values from API
          fNameController.text = r.fname ?? '';
          lastNameController.text = r.name ?? '';
          emailController.text = r.email?.toString() ?? '';
          phoneNumberController.text = r.phone?.toString() ?? '';
          cellPhoneController.text = r.cellPhone?.toString() ?? '';
          _controllersInitialized = true;

          await _saveGuestData(loggedInGuest!);
          log(
            'Updated cached guest data with API response: ${loggedInGuest.toString()}',
          );
        }
        emit(UpdateGuestSuccess(guest: r));
      },
    );
  }

  // Check if guest is logged in
  bool get isGuestLoggedIn {
    return loggedInGuest != null;
  }

  // Check if guest is logged in from cache
  Future<bool> isGuestLoggedInFromCache() async {
    try {
      final isLoggedIn =
          _cacheHelper.getData(key: CacheKey.guestLoggedIn) as bool?;
      return isLoggedIn ?? false;
    } catch (e) {
      return false;
    }
  }

  // Get current guest data
  GuestLoginModel? get currentGuest => loggedInGuest;

  // Refresh guest data from cache
  Future<void> refreshGuestData() async {
    await _loadGuestData();
    if (loggedInGuest != null) {
      emit(GuestLoginSuccess(gusetLogin: loggedInGuest!));
    }
  }

  Future<void> logoutGuest() async {
    emit(LogoutLoadingGuest());
    try {
      final result = await guestFlowRepo.logoutGuest();
      result.fold(
        (failure) =>
            emit(LogoutFailureGuest(message: failure.failure.errorMessage)),
        (success) async {
          // Clear guest data from cache
          await _cacheHelper.removeData(key: CacheKey.guestData);
          await _cacheHelper.removeData(key: CacheKey.guestLoggedIn);
          loggedInGuest = null;
          _controllersInitialized = false;
          // Clear controllers
          fNameController.clear();
          lastNameController.clear();
          emailController.clear();
          phoneNumberController.clear();
          cellPhoneController.clear();
          emit(LogoutSuccessGuest(sucess: success));
        },
      );
    } on ServerFailure catch (e) {
      emit(LogoutFailureGuest(message: e.failure.errorMessage));
    } catch (e) {
      emit(LogoutFailureGuest(message: e.toString()));
    }
  }
}
