// ملف الحالة باستخدام Freezed
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.signInLoading() = SignInLoadingState;
  const factory AuthState.signInSuccess() = SignInSuccessState;
  const factory AuthState.googleAuthLoading() = GoogleAuthLoadingState;
  const factory AuthState.googleAuthSuccess() = GoogleAuthSuccessState;
  const factory AuthState.validateOtpSuccess() = ValidateOtpSuccessState;
  const factory AuthState.sendForgetOtpSuccess() = SendForgetOtpSuccessState;
  const factory AuthState.resetPasswordSuccess() = ResetPasswordSuccessState;
  const factory AuthState.resetPasswordLoading() = ResetPasswordLoadingState;
  const factory AuthState.authError({required String message}) = AuthErrorState;
}
