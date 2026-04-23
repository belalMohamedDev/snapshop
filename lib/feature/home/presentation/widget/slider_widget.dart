import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/home/logic/homeCubit/home_cubit.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            state.maybeWhen(
              slidersLoading: () => const CircularProgressIndicator(),

              slidersSuccess: (sliderModel, currentIndex) {
                return Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          context.read<HomeCubit>().changeIndex(index);
                        },
                        height: 160.h,
                        autoPlay: true,
                        viewportFraction: 1.1,
                      ),
                      items: sliderModel.sliders!.map((banner) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                            imageUrl: banner.imagePath!,
                            fit: BoxFit.fill,
                            width: 330.w,
                          ),
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 20.h),

                    AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: sliderModel.sliders!.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.black,
                        dotHeight: 8.h,
                        spacing: 7.sp,
                        dotWidth: 8.w,
                      ),
                    ),
                  ],
                );
              },

              orElse: () => const SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
