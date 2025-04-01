import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';
import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';

import '../widgets/account_type/account_type_buttons_row.dart';
import '../widgets/account_type/description_text.dart';
import '../widgets/account_type/title_text.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Container(
                width: 372.w,
                height: 463.h,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.shadow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Image.asset(
                  'assets/images/OR.png',
                  height: 300.h,
                  width: 300.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 25.h),
              const TitleText(),
              SizedBox(height: 30.h),
              DescriptionText(text: S.of(context).userDescription),
              SizedBox(height: 10.h),
              DescriptionText(text: S.of(context).craftsmanDescription),
              SizedBox(height: 50.h),
              AccountTypeButtonsRow(
                onUserPressed: () {
                  // Navigator.of(context).pushReplacementNamed('/home_user');
                },
                onCraftsmanPressed: () {
                  // Navigator.of(context).pushReplacementNamed('/home_craftsman');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
