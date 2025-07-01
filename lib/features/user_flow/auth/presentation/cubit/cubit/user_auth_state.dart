import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_state.freezed.dart';

@freezed
class UserAuthState with _$UserAuthState {
  const factory UserAuthState.initial() = AuthInitial;
  const factory UserAuthState.otpLoading() = OtpLoadingState;
  const factory UserAuthState.otpSuccess() = OtpSuccessState;
  const factory UserAuthState.resendOtpSuccess() = ResendOtpSuccessState;
  const factory UserAuthState.signUpLoading() = SignUpLoadingState;
  const factory UserAuthState.signUpSuccess() = SignUpSuccessState;
  const factory UserAuthState.signUpError({required String message}) = SignUpErrorState;
}
