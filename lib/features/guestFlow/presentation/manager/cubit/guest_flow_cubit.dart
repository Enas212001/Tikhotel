import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ticket_flow/core/api/dio_consumer.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/guest/data/models/guest_model/guest_model.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_flow_repo.dart';
import 'package:ticket_flow/features/guestFlow/data/repo/guest_flow_repo_impl.dart';

part 'guest_flow_state.dart';

class GuestFlowCubit extends Cubit<GuestFlowState> {
  GuestFlowCubit() : super(GuestFlowInitial());
  final GuestFlowRepo guestFlowRepo = GuestFlowRepoImpl(
    api: getIt.get<DioConsumer>(),
  );
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController cellPhoneController = TextEditingController();
  String? country;
  Future<void> updateGuest(GuestModel guestModel) async {
    emit(UpdateGuestLoading());
    final result = await guestFlowRepo.updateGuest(
      guestModel.id.toString(),
      firstName: firstNameController.text.isNotEmpty
          ? firstNameController.text
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
      (r) => emit(UpdateGuestSuccess(guest: r)),
    );
  }
}
