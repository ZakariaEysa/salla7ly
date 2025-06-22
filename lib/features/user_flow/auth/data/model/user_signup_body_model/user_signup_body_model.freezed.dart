// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_signup_body_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSignupBodyModel _$UserSignupBodyModelFromJson(Map<String, dynamic> json) {
  return _UserSignupBodyModel.fromJson(json);
}

/// @nodoc
mixin _$UserSignupBodyModel {
  String? get userName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;

  /// Serializes this UserSignupBodyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSignupBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSignupBodyModelCopyWith<UserSignupBodyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSignupBodyModelCopyWith<$Res> {
  factory $UserSignupBodyModelCopyWith(
          UserSignupBodyModel value, $Res Function(UserSignupBodyModel) then) =
      _$UserSignupBodyModelCopyWithImpl<$Res, UserSignupBodyModel>;
  @useResult
  $Res call(
      {String? userName,
      String? email,
      String? password,
      String? confirmPassword,
      String? otp});
}

/// @nodoc
class _$UserSignupBodyModelCopyWithImpl<$Res, $Val extends UserSignupBodyModel>
    implements $UserSignupBodyModelCopyWith<$Res> {
  _$UserSignupBodyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSignupBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSignupBodyModelImplCopyWith<$Res>
    implements $UserSignupBodyModelCopyWith<$Res> {
  factory _$$UserSignupBodyModelImplCopyWith(_$UserSignupBodyModelImpl value,
          $Res Function(_$UserSignupBodyModelImpl) then) =
      __$$UserSignupBodyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userName,
      String? email,
      String? password,
      String? confirmPassword,
      String? otp});
}

/// @nodoc
class __$$UserSignupBodyModelImplCopyWithImpl<$Res>
    extends _$UserSignupBodyModelCopyWithImpl<$Res, _$UserSignupBodyModelImpl>
    implements _$$UserSignupBodyModelImplCopyWith<$Res> {
  __$$UserSignupBodyModelImplCopyWithImpl(_$UserSignupBodyModelImpl _value,
      $Res Function(_$UserSignupBodyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSignupBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$UserSignupBodyModelImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSignupBodyModelImpl implements _UserSignupBodyModel {
  const _$UserSignupBodyModelImpl(
      {required this.userName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.otp});

  factory _$UserSignupBodyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSignupBodyModelImplFromJson(json);

  @override
  final String? userName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confirmPassword;
  @override
  final String? otp;

  @override
  String toString() {
    return 'UserSignupBodyModel(userName: $userName, email: $email, password: $password, confirmPassword: $confirmPassword, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSignupBodyModelImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, email, password, confirmPassword, otp);

  /// Create a copy of UserSignupBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSignupBodyModelImplCopyWith<_$UserSignupBodyModelImpl> get copyWith =>
      __$$UserSignupBodyModelImplCopyWithImpl<_$UserSignupBodyModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSignupBodyModelImplToJson(
      this,
    );
  }
}

abstract class _UserSignupBodyModel implements UserSignupBodyModel {
  const factory _UserSignupBodyModel(
      {required final String? userName,
      required final String? email,
      required final String? password,
      required final String? confirmPassword,
      required final String? otp}) = _$UserSignupBodyModelImpl;

  factory _UserSignupBodyModel.fromJson(Map<String, dynamic> json) =
      _$UserSignupBodyModelImpl.fromJson;

  @override
  String? get userName;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confirmPassword;
  @override
  String? get otp;

  /// Create a copy of UserSignupBodyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSignupBodyModelImplCopyWith<_$UserSignupBodyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
