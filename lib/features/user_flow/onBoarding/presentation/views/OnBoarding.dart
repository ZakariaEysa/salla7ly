import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/navigation_buttons.dart';

/// شاشة الأونبوردينج الرئيسية
///
/// تُعرض عند أول استخدام للتطبيق لتقديم نظرة عامة على ميزاته
class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  /// متحكم في عرض الصفحات
  final PageController _pageController = PageController();

  /// رقم الصفحة الحالية
  int _currentPage = 0;

  @override
  void dispose() {
    // التخلص من الموارد عند إغلاق الشاشة
    _pageController.dispose();
    super.dispose();
  }

  /// الانتقال إلى الصفحة التالية
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
    navigateAndRemoveUntil(context: context, screen: const HomeScreen());
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
    return ScaffoldF(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // مساحة علوية
          SizedBox(height: 30.h),

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
                return OnboardingPage(
                  content: getOnBoardingContents(context)[index],
                  padding: EdgeInsets.all(30.sp),
                );
              },
            ),
          ),
          // مؤشرات الصفحات
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: DotIndicatorRow(
              count: _getPageCount(),
              currentIndex: _currentPage,
            ),
          ),
          SizedBox(height: 10.h),

          // أزرار التنقل
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: OnboardingNavigationButtons(
              type: _getNavigationButtonsType(),
              onNext: _goToNextPage,
              onPrevious: _goToPreviousPage,
              onStart: _startApp,
            ),
          ),

          // مساحة سفلية
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
