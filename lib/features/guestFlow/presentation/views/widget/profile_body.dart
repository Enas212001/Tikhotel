import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/widgets/top_widget.dart';
import 'package:ticket_flow/features/Tickets/presentation/views/widgets/request_text_field.dart';
import 'package:ticket_flow/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ticket_flow/features/guestFlow/presentation/manager/cubit/guest_flow_cubit.dart';
import 'package:ticket_flow/features/onboarding/widget/custom_button.dart';
import 'package:ticket_flow/generated/l10n.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final guest = context.read<AuthCubit>().loggedInGuest;
    final cubit = context.read<GuestFlowCubit>();
    return BlocConsumer<GuestFlowCubit, GuestFlowState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                      label: S.of(context).name,
                      value: guest?.name ?? '',
                      onChanged: (value) =>
                          cubit.firstNameController.text = value,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).email,
                      value: guest?.email ?? '',
                      onChanged: (value) => cubit.emailController.text = value,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).country,
                      isList: true,
                      value: guest?.countryId.toString() ?? '',
                    ),
                    CustomRequestTextField(
                      label: S.of(context).phone,
                      value: guest?.phone ?? '',
                      onChanged: (value) =>
                          cubit.phoneNumberController.text = value,
                    ),
                    CustomRequestTextField(
                      label: S.of(context).cellPhone,
                      value: guest?.cellPhone ?? '',
                      onChanged: (value) =>
                          cubit.cellPhoneController.text = value,
                    ),
                    SizedBox(height: 100.h),
                    CustomButton(
                      text: S.of(context).save,
                      isPrimary: true,
                      onPressed: () {
                        cubit.updateGuest(guest!);
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
