// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) {
  return _SignupResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SignupResponseModel {
  String? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  int? get expiresIn => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  DateTime? get refreshTokenExpiration => throw _privateConstructorUsedError;

  /// Serializes this SignupResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignupResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignupResponseModelCopyWith<SignupResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupResponseModelCopyWith<$Res> {
  factory $SignupResponseModelCopyWith(
          SignupResponseModel value, $Res Function(SignupResponseModel) then) =
      _$SignupResponseModelCopyWithImpl<$Res, SignupResponseModel>;
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? userName,
      String? token,
      int? expiresIn,
      String? refreshToken,
      DateTime? refreshTokenExpiration});
}

/// @nodoc
class _$SignupResponseModelCopyWithImpl<$Res, $Val extends SignupResponseModel>
    implements $SignupResponseModelCopyWith<$Res> {
  _$SignupResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? userName = freezed,
    Object? token = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? refreshTokenExpiration = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshTokenExpiration: freezed == refreshTokenExpiration
          ? _value.refreshTokenExpiration
          : refreshTokenExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupResponseModelImplCopyWith<$Res>
    implements $SignupResponseModelCopyWith<$Res> {
  factory _$$SignupResponseModelImplCopyWith(_$SignupResponseModelImpl value,
          $Res Function(_$SignupResponseModelImpl) then) =
      __$$SignupResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? email,
      String? userName,
      String? token,
      int? expiresIn,
      String? refreshToken,
      DateTime? refreshTokenExpiration});
}

/// @nodoc
class __$$SignupResponseModelImplCopyWithImpl<$Res>
    extends _$SignupResponseModelCopyWithImpl<$Res, _$SignupResponseModelImpl>
    implements _$$SignupResponseModelImplCopyWith<$Res> {
  __$$SignupResponseModelImplCopyWithImpl(_$SignupResponseModelImpl _value,
      $Res Function(_$SignupResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? userName = freezed,
    Object? token = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? refreshTokenExpiration = freezed,
  }) {
    return _then(_$SignupResponseModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshTokenExpiration: freezed == refreshTokenExpiration
          ? _value.refreshTokenExpiration
          : refreshTokenExpiration // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupResponseModelImpl implements _SignupResponseModel {
  const _$SignupResponseModelImpl(
      {this.id,
      this.email,
      this.userName,
      this.token,
      this.expiresIn,
      this.refreshToken,
      this.refreshTokenExpiration});

  factory _$SignupResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupResponseModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? userName;
  @override
  final String? token;
  @override
  final int? expiresIn;
  @override
  final String? refreshToken;
  @override
  final DateTime? refreshTokenExpiration;

  @override
  String toString() {
    return 'SignupResponseModel(id: $id, email: $email, userName: $userName, token: $token, expiresIn: $expiresIn, refreshToken: $refreshToken, refreshTokenExpiration: $refreshTokenExpiration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupResponseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.refreshTokenExpiration, refreshTokenExpiration) ||
                other.refreshTokenExpiration == refreshTokenExpiration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, userName, token,
      expiresIn, refreshToken, refreshTokenExpiration);

  /// Create a copy of SignupResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupResponseModelImplCopyWith<_$SignupResponseModelImpl> get copyWith =>
      __$$SignupResponseModelImplCopyWithImpl<_$SignupResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SignupResponseModel implements SignupResponseModel {
  const factory _SignupResponseModel(
      {final String? id,
      final String? email,
      final String? userName,
      final String? token,
      final int? expiresIn,
      final String? refreshToken,
      final DateTime? refreshTokenExpiration}) = _$SignupResponseModelImpl;

  factory _SignupResponseModel.fromJson(Map<String, dynamic> json) =
      _$SignupResponseModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get email;
  @override
  String? get userName;
  @override
  String? get token;
  @override
  int? get expiresIn;
  @override
  String? get refreshToken;
  @override
  DateTime? get refreshTokenExpiration;

  /// Create a copy of SignupResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupResponseModelImplCopyWith<_$SignupResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
