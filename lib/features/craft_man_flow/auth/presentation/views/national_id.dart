import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:salla7ly/features/craft_man_flow/auth/presentation/views/craftman_sign_up_view.dart';
import 'package:salla7ly/utils/app_logs.dart';
import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';

import '../widgets/sign_up/upload_image_container.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class NationalId extends StatelessWidget {
  const NationalId(
      {super.key, required this.text, required this.buttonText, this.onTap});
  final String text;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 52.h,
              ),
              UploadImageContainer(
                isFront: buttonText != "SignUp",
                onTap: () => buttonText == "SignUp"
                    ? uploadBackId(context)
                    : uploadFrontId(context),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: const Color(0x771262C9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Text(
                    buttonText,
                    style:
                        theme.textTheme.bodyMedium?.copyWith(fontSize: 24.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String> uploadFrontId(context) async {
    AppLogs.scussessLog("this is front");
    AuthCubit().get(context).frontId = await pickImageAndConvertToBase64();
    return AuthCubit().get(context).frontId!;
  }

  Future<String> uploadBackId(context) async {
    AppLogs.scussessLog("this is back");
    AuthCubit().get(context).backId = await pickImageAndConvertToBase64();
    return AuthCubit().get(context).backId!;
  }

  Future<String?> pickImageAndConvertToBase64() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final bytes = await File(image.path).readAsBytes();
        final base64Image = base64Encode(bytes);

        print(' image selected.');

        return base64Image;
      } else {
        print('No image selected.');
        return "";
      }
    } catch (e) {
      print('Error picking image: $e');
      return "";
    }
  }
}
