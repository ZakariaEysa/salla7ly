import 'package:equatable/equatable.dart';

class SignupResponseModel extends Equatable {
  final String? id;
  final String? email;
  final String? userName;
  final String? token;
  final int? expiresIn;
  final String? refreshToken;
  final DateTime? refreshTokenExpiration;

  const SignupResponseModel({
    this.id,
    this.email,
    this.userName,
    this.token,
    this.expiresIn,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        id: json['id'] as String?,
        email: json['email'] as String?,
        userName: json['userName'] as String?,
        token: json['token'] as String?,
        expiresIn: json['expiresIn'] as int?,
        refreshToken: json['refreshToken'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpiration'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'userName': userName,
        'token': token,
        'expiresIn': expiresIn,
        'refreshToken': refreshToken,
        'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      email,
      userName,
      token,
      expiresIn,
      refreshToken,
      refreshTokenExpiration,
    ];
  }
}
