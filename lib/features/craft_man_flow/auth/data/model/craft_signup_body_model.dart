import 'package:equatable/equatable.dart';

class CraftSignupBodyModel extends Equatable {
  final String? userName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? dateOfBirth;
  final String? idCardFrontUrl;
  final String? idCardBackUrl;
  final String? otp;

  const CraftSignupBodyModel({
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
    this.dateOfBirth,
    this.idCardFrontUrl,
    this.idCardBackUrl,
    this.otp,
  });

  factory CraftSignupBodyModel.fromJson(Map<String, dynamic> json) {
    return CraftSignupBodyModel(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      idCardFrontUrl: json['idCardFrontUrl'] as String?,
      idCardBackUrl: json['idCardBackUrl'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'dateOfBirth': dateOfBirth,
        'idCardFrontUrl': idCardFrontUrl,
        'idCardBackUrl': idCardBackUrl,
        'otp': otp,
      };

  @override
  List<Object?> get props {
    return [
      userName,
      email,
      password,
      confirmPassword,
      dateOfBirth,
      idCardFrontUrl,
      idCardBackUrl,
      otp,
    ];
  }
}
