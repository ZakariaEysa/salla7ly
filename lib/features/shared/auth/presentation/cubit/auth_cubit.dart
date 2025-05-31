import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/features/shared/auth/domain/repos/auth_repo.dart';
import 'package:salla7ly/services/failure_service.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../../../../utils/app_logs.dart';
import '../../data/model/auth_response_model.dart';
import '../../data/model/google_sign_in_model.dart';
import '../../data/model/send_forget_password_model.dart';
import '../../data/model/sign_in_model.dart';
import '../../data/model/validate_forget_password_otp_model.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final emailController = TextEditingController();
  AuthRepo authRepo;
  bool isFirstOtp = true;

  Future<void> signIn() async {
    emit(SignInLoadingState());
    final result = await authRepo.signIn(
        signInModel: SignInModel(
            email: emailController.text, password: passwordController.text));

    result
        .fold((l) => emit(AuthErrorState(message: ServiceFailure(l.errorMsg))),
            (r) async {
      await saveData(r);
      emit(SignInSuccessState());
    });
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleAuthLoadingState());
    final response = await authRepo.signInWithGoogle();

    response.fold(
      (failure) => emit(
        AuthErrorState(message: ServiceFailure(failure.errorMsg)),
      ),
      (user) async {
        await googleSignIn(googleSignInModel: user);
      },
    );
  }

  Future<void> googleSignIn(
      {required GoogleSignInModel googleSignInModel}) async {
    final response =
        await authRepo.googleSignIn(googleSignInModel: googleSignInModel);

    response.fold(
      (failure) => emit(
        AuthErrorState(message: ServiceFailure(failure.errorMsg)),
      ),
      (r) async {
        await saveData(r);

        emit(GoogleAuthSuccessState());
      },
    );
  }

  Future<void> validateForgetPasswordOtp(
      {required ValidateForgetPasswordOtpModel
          validateForgetPasswordOtpModel}) async {
    emit(ResetPasswordLoadingState());

    final response = await authRepo.validateForgetPasswordOtp(
        validateForgetPasswordOtpModel: validateForgetPasswordOtpModel);

    response.fold(
      (failure) => emit(
        AuthErrorState(message: ServiceFailure(failure.errorMsg)),
      ),
      (r) async {
        emit(ValidateOtpSuccessState());
      },
    );
  }

  Future<void> sendForgetPassword(
      {required SendForgetPasswordModel sendForgetPasswordModel}) async {
    emit(ResetPasswordLoadingState());

    final response = await authRepo.sendForgetPassword(
        sendForgetPasswordModel: sendForgetPasswordModel);

    response.fold(
      (failure) => emit(
        AuthErrorState(message: ServiceFailure(failure.errorMsg)),
      ),
      (r) async {
        emit(SendForgetOtpSuccessState());
      },
    );
  }

  Future<void> changePassword({required SignInModel signInModel}) async {
    emit(ResetPasswordLoadingState());

    final response = await authRepo.changePassword(signInModel: signInModel);

    response.fold(
      (failure) => emit(
        AuthErrorState(message: ServiceFailure(failure.errorMsg)),
      ),
      (r) async {
        emit(ResetPasswordSuccessState());
      },
    );
  }

  Future<void> saveData(AuthResponseModel r) async {
    HiveStorage.set(HiveKeys.accessToken, r.token);
    HiveStorage.set(HiveKeys.refreshToken, r.refreshToken);
    HiveStorage.set(HiveKeys.id, r.id);
    HiveStorage.set(HiveKeys.email, r.email);
    HiveStorage.set(HiveKeys.username, r.userName);
    AppLogs.infoLog(r.toString());
    AppLogs.infoLog("data Saved Successfully");
  }

  Future<void> signOut() async {
    HiveStorage.set(HiveKeys.accessToken, null);
    HiveStorage.set(HiveKeys.refreshToken, null);
    HiveStorage.set(HiveKeys.id, null);
    HiveStorage.set(HiveKeys.email, null);
    HiveStorage.set(HiveKeys.username, null);
    // emit(SignOutSuccessState());
  }
}
