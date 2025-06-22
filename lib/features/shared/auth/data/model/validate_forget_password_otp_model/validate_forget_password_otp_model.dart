import 'package:freezed_annotation/freezed_annotation.dart';
part 'validate_forget_password_otp_model.g.dart';
part 'validate_forget_password_otp_model.freezed.dart';

@freezed
class ValidateForgetPasswordOtpModel with _$ValidateForgetPasswordOtpModel {
  const factory ValidateForgetPasswordOtpModel(
      {required String? email,
      required String? otp}) = _ValidateForgetPasswordOtpModel;

  factory ValidateForgetPasswordOtpModel.fromJson(Map<String, dynamic> json) =>
      _$ValidateForgetPasswordOtpModelFromJson(json);
}
