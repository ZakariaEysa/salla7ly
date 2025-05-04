import 'package:equatable/equatable.dart';

class UserSignupBodyModel extends Equatable {
  final String? userName;
  final String? email;
  final String? password;
  final String? confirmPassword;

  final String? otp;

  const UserSignupBodyModel({
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
    this.otp,
  });

  factory UserSignupBodyModel.fromJson(Map<String, dynamic> json) {
    return UserSignupBodyModel(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'otp': otp,
      };

  @override
  List<Object?> get props {
    return [
      userName,
      email,
      password,
      confirmPassword,
      otp,
    ];
  }
}
