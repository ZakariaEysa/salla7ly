// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      userName: json['userName'] as String?,
      token: json['token'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
      refreshTokenExpiration: json['refreshTokenExpiration'] == null
          ? null
          : DateTime.parse(json['refreshTokenExpiration'] as String),
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'token': instance.token,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpiration':
          instance.refreshTokenExpiration?.toIso8601String(),
    };
