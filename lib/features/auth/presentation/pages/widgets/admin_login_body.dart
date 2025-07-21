import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/custom_toast.dart';
import 'package:ticket_flow/core/utils/api_key.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'common_auth_widget.dart';
import 'title_with_text_field.dart';
import 'package:ticket_flow/core/cache/cache_helper.dart';
import 'package:ticket_flow/core/utils/service_locator.dart';

class AdminLoginBody extends StatelessWidget {
  const AdminLoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is AdminLoginSuccess) {
          final cache = getIt<CacheHelper>();
          await cache.saveData(key: CacheKey.adminLoggedIn, value: true);
          context.go(AppRoutes.dashboard);
        } else if (state is AdminLoginFailure) {
          showToast(state.message);
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.adminLoginKey,
          child: CommonAuthWidget(
            buttonText: S.of(context).login,
            onPressed: () {
              if (cubit.adminLoginKey.currentState!.validate()) {
                cubit.adminLogin();
              }
            },
            child: Column(
              children: [
                TitleWithTextField(
                  title: S.of(context).email,
                  controller: cubit.adminEmailController,
                  hintText: S.of(context).enterYourEmail,
                ),
                SizedBox(height: 16.h),
                TitleWithTextField(
                  title: S.of(context).password,
                  controller: cubit.adminPasswordController,
                  hintText: S.of(context).enterYourPassword,
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push(AppRoutes.forgetPassword);
                    },
                    child: Text(
                      S.of(context).forgotPassword,
                      style: TextStyles.text12RegularLightGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
