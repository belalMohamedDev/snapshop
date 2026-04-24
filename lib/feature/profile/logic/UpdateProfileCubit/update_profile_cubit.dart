import 'dart:io';

import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/profile/data/repo/update_profile_repo.dart';

part 'update_profile_state.dart';
part 'update_profile_cubit.freezed.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._profileRepo) : super(UpdateProfileState.initial());

  final UpdateProfileRepo _profileRepo;

  final fullName = TextEditingController();
  final phone = TextEditingController();
  File? selectedImage;

  void setImage(File image) {
    selectedImage = image;
  }

  Future<void> updateProfile() async {
    emit(const UpdateProfileState.updateProfileLoading());

    final response = await _profileRepo.updateProfile(
      fullName.text,
      phone.text,
      selectedImage,
    );

    response.when(
      success: (dataResponse) async {
        await SharedPrefHelper.setSecuredString(
          PrefKeys.userName,
          fullName.text,
        );

        await SharedPrefHelper.setSecuredString(PrefKeys.userPhone, phone.text);

        emit(UpdateProfileState.updateProfileSuccess(dataResponse));
      },
      failure: (error) {
        emit(UpdateProfileState.updateProfileFailure(error));
      },
    );
  }

  Future<void> loadUserData() async {
    fullName.text = await SharedPrefHelper.getSecuredString(PrefKeys.userName);

    phone.text = await SharedPrefHelper.getSecuredString(PrefKeys.userPhone);
  }

  @override
  Future<void> close() {
    fullName.dispose();
    phone.dispose();
    return super.close();
  }
}
