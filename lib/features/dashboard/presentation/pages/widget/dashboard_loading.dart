import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class DashboardLoadingWidget extends StatelessWidget {
  const DashboardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10.r),
        childAspectRatio: 1.3,
        children: List.generate(
          4,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Container(color: Colors.grey[300]),
                    SizedBox(height: 8.h),
                    Container(color: Colors.grey[300]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
