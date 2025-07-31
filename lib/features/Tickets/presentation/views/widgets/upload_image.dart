// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class UploadImage extends StatefulWidget {
//   const UploadImage({super.key});

//   @override
//   State<UploadImage> createState() => _UploadHotelImageState();
// }

// class _UploadHotelImageState extends State<UploadImage> {
//   File? selectedImage;

//   Future<void> _pickImage() async {
//     final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         selectedImage = File(picked.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 10.h),
//         Text(
//           AppStrings.logoImage,
//           style: CustomTextStyles.text12RegularGrey.copyWith(
//             color: AppColors.textColor,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         GestureDetector(
//           onTap: _pickImage,
//           child: DottedBorder(
//             options: RoundedRectDottedBorderOptions(
//               radius: Radius.circular(4.r),
//               color: AppColors.borderColor,
//             ),
//             child: Container(
//               padding: EdgeInsets.all(8.r),
//               width: double.infinity,
//               height: 120.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.r),
//                 color: Colors.grey.shade100,
//               ),
//               child: selectedImage != null
//                   ? ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.file(
//                         selectedImage!,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.file_upload_outlined,
//                           color: AppColors.greyColor,
//                         ),
//                         Text(
//                           AppStrings.uploadImage,
//                           style: CustomTextStyles.text12RegularGrey,
//                         ),
//                       ],
//                     ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
