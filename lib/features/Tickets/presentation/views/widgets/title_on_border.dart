import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticket_flow/core/utils/app_colors.dart';
import 'package:ticket_flow/core/utils/assets.dart';
import 'package:ticket_flow/core/utils/text_styles.dart';
import 'package:ticket_flow/generated/l10n.dart';

class UploadFile extends StatefulWidget {
  final VoidCallback onUpload;
  final String title;
  final Widget? child;
  const UploadFile({
    super.key,
    required this.onUpload,
    required this.title,
    this.child,
  });

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  File? selectedImage;

  Future<void> _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        selectedImage = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border, width: 1.5),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: GestureDetector(
              onTap: _pickImage,
              child: selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        selectedImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                            color: AppColors.upload,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: SvgPicture.asset(Assets.imagesUpload),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          S.of(context).chooseFiles,
                          style: TextStyles.text12LightGrey,
                        ),
                      ],
                    ),
            ),
          ),
          Positioned(
            left: 7,
            top: -6,
            child: Center(
              child: Container(
                color: AppColors.scaffoldBackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(widget.title, style: TextStyles.text12LightGrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
