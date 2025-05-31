import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../config/app_router.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/navigation_buttons.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < _getPageCount() - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// الانتقال إلى الصفحة السابقة
  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// بدء استخدام التطبيق بعد الانتهاء من الأونبوردينج
  void _startApp() {
    // تعيين حالة اجتياز الأونبوردينج
    HiveStorage.set(HiveKeys.passUserOnboarding, true);

    // الانتقال إلى الشاشة الرئيسية
    context.go(AppRouter.signIn);
  }

  /// الحصول على عدد صفحات الأونبوردينج
  int _getPageCount() => getOnBoardingContents(context).length;

  /// تحديد نوع أزرار التنقل بناءً على رقم الصفحة الحالية
  NavigationButtonsType _getNavigationButtonsType() {
    if (_currentPage == 0) {
      return NavigationButtonsType.start;
    } else if (_currentPage == _getPageCount() - 1) {
      return NavigationButtonsType.end;
    } else {
      return NavigationButtonsType.middle;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ScaffoldF(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // عرض الصفحات
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _getPageCount(),
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final content = getOnBoardingContents(context)[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  child: Column(
                    children: [
                      // منطقة قابلة للتمرير تحتوي على المحتوى
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 30.h),

                              // صورة الصفحة
                              Image.asset(
                                content.image,
                                height: 300.h,
                                fit: BoxFit.contain,
                              ),

                              SizedBox(height: 15.h),

                              // نقاط الانتقال (بعد الصورة وقبل النص)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  _getPageCount(),
                                  (index) => DotIndicator(
                                      isActive: _currentPage == index),
                                ),
                              ),

                              SizedBox(height: 15.h),

                              // عنوان الصفحة
                              Text(
                                content.title,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontSize: 35.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              SizedBox(height: 15.h),

                              // وصف الصفحة
                              Text(
                                content.description,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.labelLarge?.copyWith(
                                  fontSize: 16.sp,
                                ),
                              ),

                              SizedBox(height: 30.h),
                            ],
                          ),
                        ),
                      ),

                      // منطقة الأزرار في الأسفل (خارج منطقة التمرير)
                      Padding(
                        padding: EdgeInsets.only(bottom: 15.h, top: 10.h),
                        child: _currentPage == 0
                            ? CustomButton(
                                text: S.of(context).Next,
                                onTap: _goToNextPage,
                                width: 245.w,
                                height: 58.h,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                    width: 58.w,
                                    height: 58.h,
                                    onTap: _goToPreviousPage,
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: CustomButton(
                                      text: _currentPage == _getPageCount() - 1
                                          ? S.of(context).Start
                                          : S.of(context).Next,
                                      onTap: _currentPage == _getPageCount() - 1
                                          ? _startApp
                                          : _goToNextPage,
                                      width: 190.w,
                                      height: 58.h,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      SizedBox(height: 18.h),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
