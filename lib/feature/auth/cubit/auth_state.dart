part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.registerSuccess(AuthResponse response) =
      _RegisterSuccess;
  const factory AuthState.registerFailure(ApiErrorModel error) =
      _RegisterFailure;
  const factory AuthState.registerLoading() = _RegisterLoading;
  const factory AuthState.loginLoading() = _LoginLoading;
  const factory AuthState.loginSuccess(AuthResponse response) = _LoginSuccess;
  const factory AuthState.loginFailure(ApiErrorModel error) = _LoginFailure;

  const factory AuthState.showPassword(bool show) = _ShowPassword;
  const factory AuthState.showConfirmPassword(bool show) = _ShowConfirmPassword;
  
}
