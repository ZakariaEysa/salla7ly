// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craft_signup_body_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CraftSignupBodyModelImpl _$$CraftSignupBodyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CraftSignupBodyModelImpl(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      idCardFrontUrl: json['idCardFrontUrl'] as String?,
      idCardBackUrl: json['idCardBackUrl'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$CraftSignupBodyModelImplToJson(
        _$CraftSignupBodyModelImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'dateOfBirth': instance.dateOfBirth,
      'idCardFrontUrl': instance.idCardFrontUrl,
      'idCardBackUrl': instance.idCardBackUrl,
      'otp': instance.otp,
    };
