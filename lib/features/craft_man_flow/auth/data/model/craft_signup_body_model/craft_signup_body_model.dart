import 'package:freezed_annotation/freezed_annotation.dart';

part 'craft_signup_body_model.freezed.dart';
part 'craft_signup_body_model.g.dart';

@freezed
class CraftSignupBodyModel with _$CraftSignupBodyModel {
  const factory CraftSignupBodyModel({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    String? dateOfBirth,
    String? idCardFrontUrl,
    String? idCardBackUrl,
    String? otp,
  }) = _CraftSignupBodyModel;

  factory CraftSignupBodyModel.fromJson(Map<String, dynamic> json) =>
      _$CraftSignupBodyModelFromJson(json);
}
