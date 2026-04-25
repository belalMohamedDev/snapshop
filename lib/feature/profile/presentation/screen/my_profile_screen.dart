import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/logic/UpdateProfileCubit/update_profile_cubit.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<UpdateProfileCubit>()..loadUserData(),
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          final updateProfileCubit = context.read<UpdateProfileCubit>();

          return Scaffold(
            appBar: AppBar(title: Text(context.translate("myProfile")), centerTitle: true),
            body: Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: Column(
                children: [
                  Center(child: Image.asset(ImageAsset.profile, width: 120.w)),
                  SizedBox(height: 10.h),
                  SizedBox(height: 20.h),

                  TextFormField(
                    controller: updateProfileCubit.fullName,
                    validator: (value) {
                      if (!AppRegex.isNameValid(value!)) {
                        return context.translate("pleaseEnterAValidName");
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: context.translate("firstName"),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormField(
                    validator: (value) {
                      if (!AppRegex.isPhoneNumberValid(value!)) {
                        return context.translate("pleaseEnterAValidPhoneNumber");
                      }

                      return null;
                    },
                    controller: updateProfileCubit.phone,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        borderSide: BorderSide(color: Colors.black54),
                      ),

                      hintText: context.translate("phone"),

                      prefixIcon: Icon(Icons.phone, color: Colors.black54),
                    ),
                  ),

                  SizedBox(height: 25.h),
                  SizedBox(
                    width: 325.w,
                    height: 46.h,

                    child: ElevatedButton(
                      onPressed: () => updateProfileCubit.updateProfile(),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      child: state.maybeWhen(
                        updateProfileLoading: () =>
                            const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                        orElse: () => Text(
                          context.translate("save"),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
