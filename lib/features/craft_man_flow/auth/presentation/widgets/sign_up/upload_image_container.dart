// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/cubit/cubit/auth_cubit.dart';

class UploadImageContainer extends StatefulWidget {
  UploadImageContainer({
    Key? key,
    required this.onTap,
    required this.isFront,
  }) : super(key: key);
  final Future<String?> Function() onTap;
  final bool isFront;

  @override
  State<UploadImageContainer> createState() => _UploadImageContainerState();
}

class _UploadImageContainerState extends State<UploadImageContainer> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 340.w,
      height: 470.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.colorScheme.onPrimaryFixed),
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          SizedBox(
            height: 150.h,
            width: 300.w,
            child: Column(
              children: [
                SizedBox(
                  width: 45.w,
                  height: 36.h,
                  child: Image.asset(
                    "assets/icons/imageUploadIcon.png",
                  ),
                ),
                Text('Upload Image',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith()),
                Text('Select or drag and drop your image',
                    textAlign: TextAlign.center,
                    style:
                        theme.textTheme.bodySmall?.copyWith(fontSize: 14.sp)),
              ],
            ),
          ),
          Container(
            width: 310.w,
            height: 170,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 50.w,
                  height: 50.h,
                  child: Image.asset(
                    "assets/icons/frame.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 9.h),
                  child: Text('PNG, JPG up to 10MB',
                      textAlign: TextAlign.center,
                      style:
                          theme.textTheme.bodySmall?.copyWith(fontSize: 14.sp)),
                ),
                GestureDetector(
                  onTap: () async {
                    String? image = await widget.onTap();
                    print("image");
                    if (image != "") {
                      isLoaded = true;
                    }
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 9.h),
                    alignment: Alignment.center,
                    width: 115.64,
                    height: 36,
                    decoration: ShapeDecoration(
                      color: theme.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        side:
                            BorderSide(color: theme.colorScheme.onPrimaryFixed),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Choose File',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge
                            ?.copyWith(fontSize: 14.sp)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Uploading...',
                    style:
                        theme.textTheme.bodySmall?.copyWith(fontSize: 14.sp)),
                Text(isLoaded ? '100%' : '0%',
                    style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: 14.sp, color: theme.colorScheme.primary))
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            alignment: Alignment.center,
            width: 310.w,
            height: 8.h,
            decoration: ShapeDecoration(
              color: isLoaded
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSecondaryContainer,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: theme.colorScheme.onSecondaryContainer),
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          isLoaded
              ? Container(
                  width: 325.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryFixedDim,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        child: Row(
                          children: [
                            SizedBox(width: 20.w),
                            Image.asset(
                              "assets/icons/success.png",
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              'Upload Complete',
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onTertiary,
                                fontSize: 14.sp,
                              ),
                              maxLines: 9999,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => showBase64ImageOverlay(
                          context,
                          widget.isFront
                              ? AuthCubit().get(context).frontId ?? ""
                              : AuthCubit().get(context).backId ?? "",
                        ),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            'View File',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void showBase64ImageOverlay(BuildContext context, String base64Image) {
    Uint8List imageBytes = base64Decode(base64Image);

    showDialog(
      context: context,
      barrierDismissible: true, // تقدر تقفله بالضغط برا
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.memory(
              imageBytes,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
