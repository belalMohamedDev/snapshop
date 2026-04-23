import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snapshop/core/common/animations/animate_do.dart';
import 'package:snapshop/core/style/images/asset_manger.dart';
import 'package:snapshop/feature/onBoarding/data/model/on_boarding_model.dart';

class PageViewSliderObject extends StatelessWidget {
  const PageViewSliderObject(this._sliderObject, this._index, {super.key});
  final SliderObject? _sliderObject;
  final int? _index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          '${_sliderObject?.image}',
          height: 1.sh,
          width: 1.sw,
          fit: BoxFit.cover,
        ),

        Positioned(
          bottom: 0,
          left: 0,
          child: Image.asset(ImageAsset.shadow, height: 500.h),
        ),

        Positioned(
          bottom: 160.h,
          left: _index == 1 ? 60.w : 40.w,
          child: CustomFadeInUp(
            duration: 1,
            child: Column(
              children: [
                CustomFadeInRight(
                  duration: 1,
                  child: Text(
                    "${_sliderObject?.title}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                CustomFadeInLeft(
                  duration: 1,
                  child: Text(
                    "${_sliderObject?.subTitle}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
