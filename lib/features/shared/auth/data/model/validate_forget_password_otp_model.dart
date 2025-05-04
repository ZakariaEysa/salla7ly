import 'package:equatable/equatable.dart';

class ValidateForgetPasswordOtpModel extends Equatable {
  final String? email;
  final String? otp;

  const ValidateForgetPasswordOtpModel({this.email, this.otp});

  factory ValidateForgetPasswordOtpModel.fromJson(Map<String, dynamic> json) {
    return ValidateForgetPasswordOtpModel(
      email: json['email'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'otp': otp,
      };

  @override
  List<Object?> get props => [email, otp];
}
