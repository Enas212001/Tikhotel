import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_flow/core/func/container_decoration.dart';
import 'package:ticket_flow/core/utils/app_routes.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

import 'delete_problem.dart';

class ProblemCard extends StatelessWidget {
  const ProblemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: containerDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).problem,
              style: TextStyles.text12RegularDarkGrey,
            ),
            Text(
              '1st floor ceiling painting',
              style: TextStyles.text12RegularLightGrey,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.updateProblem);
                  },
                  child: SvgPicture.asset(
                    Assets.imagesEdit,
                    width: 18.sp,
                    height: 18.sp,
                  ),
                ),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => DeleteProblemDialog(),
                    );
                  },
                  child: SvgPicture.asset(
                    Assets.imagesDelete,
                    width: 18.sp,
                    height: 18.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
