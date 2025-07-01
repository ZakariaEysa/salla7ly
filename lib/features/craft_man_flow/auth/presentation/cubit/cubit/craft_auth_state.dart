import 'package:freezed_annotation/freezed_annotation.dart';

part 'craft_auth_state.freezed.dart';

@freezed
class CraftAuthState with _$CraftAuthState {
  const factory CraftAuthState.initial() = AuthInitial;
  const factory CraftAuthState.otpLoading() = OtpLoadingState;
  const factory CraftAuthState.otpSuccess() = OtpSuccessState;
  const factory CraftAuthState.resendOtpSuccess() = ResendOtpSuccessState;
  const factory CraftAuthState.signUpLoading() = SignUpLoadingState;
  const factory CraftAuthState.signUpSuccess() = SignUpSuccessState;
  const factory CraftAuthState.signUpError({required String message}) = SignUpErrorState;
}
