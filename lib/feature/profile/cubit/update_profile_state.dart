part of 'update_profile_cubit.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = _Initial;
  const factory UpdateProfileState.updateProfileLoading() =
      _UpdateProfileLoading;
  const factory UpdateProfileState.updateProfileSuccess(ApiSuccessGeneralModel data) = _UpdateProfileSuccess;
  const factory UpdateProfileState.updateProfileFailure(ApiErrorModel error) =
      _UpdateProfileFailure;
}
