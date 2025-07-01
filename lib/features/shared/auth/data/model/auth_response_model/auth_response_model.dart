import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required String? id,
    required String? email,
    required String? userName,
    required String? token,
    required int? expiresIn,
    required String? refreshToken,
    required DateTime? refreshTokenExpiration,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
