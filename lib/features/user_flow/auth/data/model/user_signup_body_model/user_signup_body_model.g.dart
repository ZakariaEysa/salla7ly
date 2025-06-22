// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSignupBodyModelImpl _$$UserSignupBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserSignupBodyModelImpl(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$UserSignupBodyModelImplToJson(
        _$UserSignupBodyModelImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'otp': instance.otp,
    };
