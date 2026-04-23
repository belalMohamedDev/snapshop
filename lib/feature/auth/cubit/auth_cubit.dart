import 'package:snapshop/core/common/shared/shared_imports.dart';
import 'package:snapshop/feature/auth/data/model/auth_response.dart';
import 'package:snapshop/feature/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthState.initial());

  bool showPass = true;
  bool showConfirmPass = true;

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void toggleShowPassword() {
    showPass = !showPass;
    emit(AuthState.showPassword(showPass));
  }

  void toggleShowConfirmPassword() {
    showConfirmPass = !showConfirmPass;
    emit(AuthState.showConfirmPassword(showConfirmPass));
  }

  final AuthRepo _authRepo;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    emit(const AuthState.loginLoading());

    final response = await _authRepo.login(email.text, password.text);

    response.when(
      success: (dataResponse) {
        emit(AuthState.loginSuccess(dataResponse));
      },
      failure: (error) {
        emit(AuthState.loginFailure(error));
      },
    );
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (password.text != confirmPassword.text) {
      emit(
        AuthState.registerFailure(
          ApiErrorModel(message: "Passwords do not match"),
        ),
      );
      return;
    }
    emit(const AuthState.registerLoading());

    final response = await _authRepo.register(
      name: fullName.text,
      email: email.text,
      password: password.text,
      phone: phone.text,
    );

    response.when(
      success: (dataResponse) {
        emit(AuthState.registerSuccess(dataResponse));
      },
      failure: (error) {
        emit(AuthState.registerFailure(error));
      },
    );
  }
}
