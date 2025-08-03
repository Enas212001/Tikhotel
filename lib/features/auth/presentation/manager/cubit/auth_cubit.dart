import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guest_login_model.dart';
import 'package:ticket_flow/features/auth/data/models/login_model/login_model.dart';
import 'package:ticket_flow/features/auth/data/repo/auth_repo.dart';
import 'package:ticket_flow/features/auth/data/repo/auth_repo_impl.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthRepo authRepo = AuthRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> adminLoginKey = GlobalKey<FormState>();
  GlobalKey<FormState> guestLoginKey = GlobalKey<FormState>();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();

  Future<void> adminLogin() async {
    emit(AdminLoginLoading());
    try {
      final result = await authRepo.adminLogin(
        email: adminEmailController.text,
        password: adminPasswordController.text,
      );
      result.fold(
        (failure) =>
            emit(AdminLoginFailure(message: failure.failure.errorMessage)),
        (success) => emit(AdminLoginSuccess(loginModel: success)),
      );
    } on ServerFailure catch (e) {
      emit(AdminLoginFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(AdminLoginFailure(message: e.toString()));
    }
  }

  Future<void> guestLogin() async {
    emit(GuestLoginLoading());
    try {
      final result = await authRepo.guestLogin(
        roomNumber: roomNumberController.text,
        firstName: firstNameController.text,
      );
      result.fold(
        (failure) =>
            emit(GuestLoginFailure(message: failure.failure.errorMessage)),
        (guestLogin) {
          emit(GuestLoginSuccess(gusetLogin: guestLogin));
        },
      );
    } on ServerFailure catch (e) {
      emit(GuestLoginFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(GuestLoginFailure(message: e.toString()));
    }
  }

  // In AuthCubit
  GuestModel? loggedInGuest;

  void setLoggedInGuest(GuestModel guest) {
    loggedInGuest = guest;
  }

  void loadCachedGuest() {
    final cache = getIt<CacheHelper>();
    final jsonData = cache.getData(key: CacheKey.guestData);

    if (jsonData != null) {
      try {
        final Map<String, dynamic> map = jsonDecode(jsonData);
        loggedInGuest = GuestModel.fromJson(map);
      } catch (e) {
        loggedInGuest = null;
      }
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      final result = await authRepo.logout();
      result.fold(
        (failure) => emit(LogoutFailure(message: failure.failure.errorMessage)),
        (success) => emit(LogoutSuccess(sucess: success)),
      );
    } on ServerFailure catch (e) {
      emit(LogoutFailure(message: e.failure.errorMessage));
    } catch (e) {
      emit(LogoutFailure(message: e.toString()));
    }
  }
}
