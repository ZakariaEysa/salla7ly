import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_signup_body_model.g.dart';
part 'user_signup_body_model.freezed.dart';

@freezed
class UserSignupBodyModel with _$UserSignupBodyModel {
  const factory UserSignupBodyModel({
    required String? userName,
    required String? email,
    required String? password,
    required String? confirmPassword,
    required String? otp,
  }) = _UserSignupBodyModel;

  factory UserSignupBodyModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignupBodyModelFromJson(json);
}
