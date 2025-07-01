import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../services/failure_service.dart';
import '../../../../../data/secure_storage_service.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../../../../utils/app_logs.dart';

import '../../domain/repos/auth_repo.dart';
import '../../data/model/auth_response_model/auth_response_model.dart';
import '../../data/model/google_sign_in_model/google_sign_in_model.dart';
import '../../data/model/send_forget_password_model/send_forget_password_model.dart';
import '../../data/model/sign_in_model/sign_in_model.dart';
import '../../data/model/validate_forget_password_otp_model/validate_forget_password_otp_model.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(const AuthState.initial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isFirstOtp = true;

  final AuthRepo authRepo;

  Future<void> signIn() async {
    emit(const AuthState.signInLoading());
    final result = await authRepo.signIn(
      signInModel: SignInModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (authResponse) async {
        await saveData(authResponse);
        emit(const AuthState.signInSuccess());
      },
    );
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.googleAuthLoading());
    final response = await authRepo.signInWithGoogle();

    response.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (user) async => await googleSignIn(googleSignInModel: user),
    );
  }

  Future<void> googleSignIn(
      {required GoogleSignInModel googleSignInModel}) async {
    final response =
        await authRepo.googleSignIn(googleSignInModel: googleSignInModel);

    response.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (authResponse) async {
        await saveData(authResponse);
        emit(const AuthState.googleAuthSuccess());
      },
    );
  }

  Future<void> sendForgetPassword(
      {required SendForgetPasswordModel sendForgetPasswordModel}) async {
    emit(const AuthState.resetPasswordLoading());
    final response = await authRepo.sendForgetPassword(
        sendForgetPasswordModel: sendForgetPasswordModel);

    response.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (_) => emit(const AuthState.sendForgetOtpSuccess()),
    );
  }

  Future<void> resendForgetPassword(
      {required SendForgetPasswordModel sendForgetPasswordModel}) async {
    emit(const AuthState.resetPasswordLoading());
    final response = await authRepo.sendForgetPassword(
        sendForgetPasswordModel: sendForgetPasswordModel);

    response.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (_) => emit(const AuthState.resendForgetOtpSuccess()),
    );
  }

  Future<void> validateForgetPasswordOtp({
    required ValidateForgetPasswordOtpModel validateForgetPasswordOtpModel,
  }) async {
    emit(const AuthState.resetPasswordLoading());
    final response = await authRepo.validateForgetPasswordOtp(
      validateForgetPasswordOtpModel: validateForgetPasswordOtpModel,
    );

    response.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (_) => emit(const AuthState.validateOtpSuccess()),
    );
  }

  Future<void> changePassword({required SignInModel signInModel}) async {
    emit(const AuthState.resetPasswordLoading());
    final response = await authRepo.changePassword(signInModel: signInModel);

    response.fold(
      (failure) => emit(AuthState.authError(message: failure.errorMsg)),
      (_) => emit(const AuthState.resetPasswordSuccess()),
    );
  }

  Future<void> saveData(AuthResponseModel r) async {
    final storage = SecureStorageService();

    await storage.write(key: HiveKeys.accessToken, value: r.token ?? "");
    await storage.write(
        key: HiveKeys.refreshToken, value: r.refreshToken ?? "");

    HiveStorage.set(HiveKeys.id, r.id);
    HiveStorage.set(HiveKeys.email, r.email);
    HiveStorage.set(HiveKeys.username, r.userName);

    AppLogs.infoLog(r.toString());
    AppLogs.infoLog("data Saved Successfully");
  }

  Future<void> signOut() async {
    final storage = SecureStorageService();

    await storage.write(key: HiveKeys.accessToken, value: "");
    await storage.write(key: HiveKeys.refreshToken, value: "");

    HiveStorage.set(HiveKeys.id, null);
    HiveStorage.set(HiveKeys.email, null);
    HiveStorage.set(HiveKeys.username, null);
  }
}
