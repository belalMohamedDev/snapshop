import 'package:flutter/gestures.dart';
import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/cubit/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            registerSuccess: (_) {
              ShowToast.showToastSuccessTop(
                message: 'Account created successfully',
                context: context,
              );

              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginRoute,
                (route) => false,
              );
            },
            registerFailure: (error) {
              ShowToast.showToastErrorTop(
                errorMessage: error.message ?? 'Register failed',
                context: context,
              );
            },
          );
        },
        builder: (context, state) {
          final authCubit = context.read<AuthCubit>();
          return Padding(
            padding: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            child: SingleChildScrollView(
              child: Form(
                key: authCubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.translate("createAccount"),
                      textAlign: TextAlign.left,

                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    TextFormField(
                      controller: authCubit.fullName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.translate("pleaseEnterAValidName");
                        }
                        if (!AppRegex.isNameValid(value)) {
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
                      controller: authCubit.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.translate("pleaseEnterAValidPhoneNumber");
                        }
                        if (!AppRegex.isPhoneNumberValid(value)) {
                          return context.translate("pleaseEnterAValidPhoneNumber");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: context.translate("phone"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        prefixIcon: Icon(Icons.phone, color: Colors.black54),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    TextFormField(
                      controller: authCubit.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.translate("pleaseEnterValidEmail");
                        }

                        if (!AppRegex.isEmailValid(value)) {
                          return context.translate("pleaseEnterValidEmail");
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: context.translate("email"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.black54),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    TextFormField(
                      controller: authCubit.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.translate("pleaseEnterValidPassword");
                        }

                        if (!AppRegex.isPasswordValid(value)) {
                          return context.translate("pleaseEnterValidPassword");
                        }

                        return null;
                      },
                      obscureText: authCubit.showPass,

                      decoration: InputDecoration(
                        hintText: context.translate("password"),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => authCubit.toggleShowPassword(),
                          icon: authCubit.showPass
                              ? Icon(Icons.visibility, color: Colors.black54)
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.black54,
                                ),
                        ),

                        prefixIcon: Icon(Icons.lock, color: Colors.black54),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      controller: authCubit.confirmPassword,
                      obscureText: authCubit.showConfirmPass,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return context.translate("pleaseEnterValidPassword");
                        }

                        if (!AppRegex.isPasswordValid(value)) {
                          return context.translate("pleaseEnterValidPassword");
                        }

                        return null;
                      },

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        hintText: context.translate("confirmPassword"),
                        suffixIcon: IconButton(
                          onPressed: () =>
                              authCubit.toggleShowConfirmPassword(),
                          icon: authCubit.showConfirmPass
                              ? Icon(Icons.visibility, color: Colors.black54)
                              : Icon(
                                  Icons.visibility_off,
                                  color: Colors.black54,
                                ),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.black54),
                      ),
                    ),

                    SizedBox(height: 25.h),
                    SizedBox(
                      width: 325.w,
                      height: 46.h,

                      child: ElevatedButton(
                        onPressed: () => authCubit.register(),

                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        child: state.maybeWhen(
                          registerLoading: () =>
                              const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                          orElse: () => Text(
                            context.translate("signUp"),
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "${context.translate("alreadyHaveAccount")} ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                              text: context.translate("logIn"),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.loginRoute,
                                    (route) => false,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
