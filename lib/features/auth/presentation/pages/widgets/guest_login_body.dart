import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';
import 'package:ticket_flow/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'common_auth_widget.dart';
import 'title_with_text_field.dart';

class GuestLoginBody extends StatelessWidget {
  const GuestLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is GuestLoginSuccess) {
          final cache = getIt<CacheHelper>();
          await cache.saveData(key: CacheKey.adminLoggedIn, value: true);
          context.go(AppRoutes.dashboard);
        } else if (state is GuestLoginFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.guestLoginKey,
          child: CommonAuthWidget(
            buttonText: S.of(context).login,
            onPressed: () {
              if (cubit.guestLoginKey.currentState!.validate()) {
                cubit.guestLogin();
              }
            },
            child: Column(
              children: [
                TitleWithTextField(
                  title: S.of(context).roomNumber,
                  controller: cubit.roomNumberController,
                  hintText: S.of(context).enterYourRoomNumber,
                ),
                SizedBox(height: 16.h),
                TitleWithTextField(
                  title: S.of(context).firstName,
                  controller: cubit.firstNameController,
                  hintText: S.of(context).enterYourFirstName,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
