import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/auth/data/models/guset_login/guest_login_model.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/auth_cubit/guest_flow_cubit.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuestFlowCubit, GuestFlowState>(
      builder: (context, state) {
        final cubit = context.read<GuestFlowCubit>();
        final guest = cubit.loggedInGuest;
        log('Profile Body - Guest: ${guest.toString()}');

        // Initialize controllers with guest data if available
        if (guest != null) {
          cubit.initializeProfileControllers();
        }

        // Show loading or error state if no guest data
        if (guest == null) {
          return Column(
            children: [
              TopWidget(title: S.of(context).profile, noSearchBar: true),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_off, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'No guest data available',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Please login again',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            TopWidget(title: S.of(context).profile, noSearchBar: true),
            Padding(
              padding: EdgeInsetsGeometry.all(16.r),
              child: Container(
                padding: EdgeInsets.all(20.r),
                decoration: containerDecoration(),
                child: Column(
                  children: [
                    CustomRequestTextField(
                      isReadOnly: false,
                      label: S.of(context).name,
                      controller: cubit.fNameController,
                    ),
                    CustomRequestTextField(
                      isReadOnly: false,
                      label: S.of(context).email,
                      controller: cubit.emailController,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).country,
                      isList: true,
                    ),
                    CustomRequestTextField(
                      isReadOnly: false,
                      label: S.of(context).phone,
                      controller: cubit.phoneNumberController,
                    ),
                    CustomRequestTextField(
                      isReadOnly: false,
                      label: S.of(context).cellPhone,
                      controller: cubit.cellPhoneController,
                    ),

                    SizedBox(height: 100.h),
                    BlocBuilder<GuestFlowCubit, GuestFlowState>(
                      builder: (context, updateState) {
                        // Show success/error messages
                        if (updateState is UpdateGuestSuccess) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Profile updated successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          });
                        } else if (updateState is UpdateGuestFailure) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(updateState.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          });
                        }

                        return CustomButton(
                          text: updateState is UpdateGuestLoading
                              ? 'Saving...'
                              : S.of(context).save,
                          isPrimary: true,
                          onPressed: updateState is UpdateGuestLoading
                              ? () {}
                              : () {
                                  // Convert GuestLoginModel to GuestModel for update
                                  final guestModel = guest.toGuestModel();
                                  cubit.updateGuest(guestModel);
                                },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
