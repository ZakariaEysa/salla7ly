import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_verification_otp_model.freezed.dart';
part 'send_verification_otp_model.g.dart';

@freezed
class SendVerificationOtpModel with _$SendVerificationOtpModel {
  const factory SendVerificationOtpModel({
    String? userName,
    String? email,
  }) = _SendVerificationOtpModel;

  factory SendVerificationOtpModel.fromJson(Map<String, dynamic> json) =>
      _$SendVerificationOtpModelFromJson(json);
}
