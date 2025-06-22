import 'package:freezed_annotation/freezed_annotation.dart';
part 'google_sign_in_model.freezed.dart';
part 'google_sign_in_model.g.dart';

@freezed
class GoogleSignInModel with _$GoogleSignInModel {
  const factory GoogleSignInModel(
      {required String? email, required String? name}) = _GoogleSignInModel;

  factory GoogleSignInModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleSignInModelFromJson(json);
}
