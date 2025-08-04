import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/error/server_failure.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/auth/data/models/login_model/login_model.dart';
import 'package:ticket_flow/features/auth/data/repo/auth_repo.dart';
import 'package:ticket_flow/features/auth/data/repo/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final AuthRepo authRepo = AuthRepoImpl(api: getIt.get<DioConsumer>());
  GlobalKey<FormState> adminLoginKey = GlobalKey<FormState>();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

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

  // // In AuthCubit
  // GuestModel? loggedInGuest;

  // void setLoggedInGuest(GuestModel guest) {
  //   loggedInGuest = guest;
  // }

  // void loadCachedGuest() {
  //   final cache = getIt<CacheHelper>();
  //   final jsonData = cache.getData(key: CacheKey.guestData);

  //   if (jsonData != null) {
  //     try {
  //       final Map<String, dynamic> map = jsonDecode(jsonData);
  //       loggedInGuest = GuestModel.fromJson(map);
  //     } catch (e) {
  //       loggedInGuest = null;
  //     }
  //   }
  // }

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
