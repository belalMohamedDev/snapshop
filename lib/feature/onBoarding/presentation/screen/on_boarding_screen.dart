import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/onBoarding/logic/cubit/on_boarding_cubit.dart';
import 'package:snapshop/feature/onBoarding/presentation/widget/page_indicator_widget.dart';
import 'package:snapshop/feature/onBoarding/presentation/widget/slider_object.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          var cubit = context.read<OnBoardingCubit>();
          return Stack(
            children: [
              PageView.builder(
                controller: cubit.pageController,
                itemCount: cubit.list.length,
                onPageChanged: cubit.updatePage,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: PageViewSliderObject(cubit.list[index], index),
                  );
                },
              ),

              Positioned(
                top: 80.h,
                right: cubit.currentIndex == 1 ? 250.w : 50.w,
                child: PageIndicatorWidget(onBoardingCubit: cubit),
              ),

              Positioned(
                bottom: 80.h,
                left: 25.w,
                child: SizedBox(
                  width: 325.w,
                  height: 46.h,

                  child: ElevatedButton(
                    onPressed: () => cubit.goNext(context),

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                    ),
                    child: Text(
                      cubit.currentIndex == 2 ? context.translate("letsGetStarted") : context.translate("next"),
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
