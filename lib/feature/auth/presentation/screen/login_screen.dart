import 'package:flutter/gestures.dart';
import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 120.h, left: 25.w, right: 25.w),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              loginSuccess: (response) {
                unawaited(() async {
                  if (response.accessToken != null) {
                    await SharedPrefHelper.setSecuredString(
                      PrefKeys.accessToken,
                      response.accessToken!,
                    );
                  }

                  if (response.refreshToken != null) {
                    await SharedPrefHelper.setSecuredString(
                      PrefKeys.refreshToken,
                      response.refreshToken!,
                    );
                  }

                  if (response.user?.name != null) {
                    await SharedPrefHelper.setSecuredString(
                      PrefKeys.userName,
                      response.user!.name!,
                    );
                  }

                  if (response.user?.email != null) {
                    await SharedPrefHelper.setSecuredString(
                      PrefKeys.userEmail,
                      response.user!.email!,
                    );
                  }

                  if (response.user?.phone != null) {
                    await SharedPrefHelper.setSecuredString(
                      PrefKeys.userPhone,
                      response.user!.phone!,
                    );
                  }

                  if (!context.mounted) return;

                  Navigator.restorablePushNamedAndRemoveUntil(
                    context,
                    Routes.bottomNavBarRoute,
                    (route) => false,
                  );

                  ShowToast.showToastSuccessTop(
                    message: 'Login successful',
                    context: context,
                  );
                }());
              },
              loginFailure: (error) {
                ShowToast.showToastErrorTop(
                  errorMessage: error.message ?? 'Login failed',
                  context: context,
                );
              },
            );
          },
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();
            return SingleChildScrollView(
              child: Form(
                key: authCubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome\n Back !",
                      textAlign: TextAlign.left,

                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    TextFormField(
                      controller: authCubit.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }

                        if (!AppRegex.isEmailValid(value)) {
                          return "Enter a valid email";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.black54),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextFormField(
                      obscureText: authCubit.showPass,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }

                        if (!AppRegex.isPasswordValid(value)) {
                          return "Enter a valid password";
                        }

                        return null;
                      },
                      controller: authCubit.password,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          borderSide: BorderSide(color: Colors.black54),
                        ),

                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () => authCubit.toggleShowPassword(),
                          icon: Icon(
                            authCubit.showPass
                                ? Icons.visibility
                                : Icons.visibility_off,
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
                        onPressed: () => authCubit.login(),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        child: state.maybeWhen(
                          loginLoading: () => const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                          orElse: () => Text(
                            "Login",
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
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign Up",

                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),

                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.restorablePushNamedAndRemoveUntil(
                                    context,
                                    Routes.registerRoute,
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
            );
          },
        ),
      ),
    );
  }
}
