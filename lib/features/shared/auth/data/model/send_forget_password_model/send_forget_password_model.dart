import 'package:freezed_annotation/freezed_annotation.dart';
part 'send_forget_password_model.g.dart';
part 'send_forget_password_model.freezed.dart';

@freezed
class SendForgetPasswordModel with _$SendForgetPasswordModel {
  const factory SendForgetPasswordModel({required String? email}) =
      _SendForgetPasswordModel;

  factory SendForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$SendForgetPasswordModelFromJson(json);
}
