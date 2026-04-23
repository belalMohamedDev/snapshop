import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:snapshop/core/common/animations/animate_do.dart';
import 'package:snapshop/feature/onBoarding/logic/cubit/on_boarding_cubit.dart';

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, this.onBoardingCubit});
  final OnBoardingCubit? onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 1,
      child: SmoothPageIndicator(
        effect: ExpandingDotsEffect(
          dotColor: onBoardingCubit!.currentIndex == 2
              ? Colors.grey
              : Colors.white,
          activeDotColor: Colors.black,
          dotHeight: 8.h,
          spacing: 7.sp,
          dotWidth: 15.w,
          expansionFactor: 4,
        ),
        controller: onBoardingCubit!.pageController,
        count: onBoardingCubit!.list.length,
      ),
    );
  }
}
