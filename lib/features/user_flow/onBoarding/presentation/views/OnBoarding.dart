import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';

import '../../../home/presentation/views/home_screen.dart';
import '../widgets/onboarding_content.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var theme = Theme.of(context);
    return ScaffoldF(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50.h,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: getOnBoardingContents(context).length,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                return SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            getOnBoardingContents(context)[index].image,
                            height: 300.h,
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              getOnBoardingContents(context).length,
                              (dotIndex) => buildDot(dotIndex),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            getOnBoardingContents(context)[index].title,
                            style: theme.textTheme.labelLarge!
                                .copyWith(fontSize: 35.sp),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            getOnBoardingContents(context)[index].description,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.labelLarge!
                                .copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 40.h),
                          currentPage == 0
                              ? CustomButton(
                                  text: lang.Next,
                                  onTap: () {
                                    if (currentPage <
                                        getOnBoardingContents(context).length -
                                            1) {
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  width: 170.w,
                                  height: 58.h,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                      width: 78.w,
                                      height: 58.h,
                                      onTap: () {
                                        if (currentPage > 0) {
                                          _pageController.previousPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      },
                                    ),
                                    SizedBox(width: 20.w),
                                    Expanded(
                                      child: CustomButton(
                                        text: currentPage ==
                                                getOnBoardingContents(context)
                                                        .length -
                                                    1
                                            ? lang.Start
                                            : lang.Next,
                                        onTap: () {
                                          if (currentPage ==
                                              getOnBoardingContents(context)
                                                      .length -
                                                  1) {
                                            HiveStorage.set(
                                                HiveKeys.passUserOnboarding,
                                                true);

                                            navigateAndRemoveUntil(
                                                context: context,
                                                screen: const HomeScreen());
                                          } else if (currentPage <
                                              getOnBoardingContents(context)
                                                      .length -
                                                  1) {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        },
                                        width: 170.w,
                                        height: 58.h,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut,
      height: 12.h,
      width: 12.w, 
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: currentPage == index ? const Color(0xFF0062FF) : Colors.white,
      ),
    );
  }
}
