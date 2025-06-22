// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_verification_otp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendVerificationOtpModel _$SendVerificationOtpModelFromJson(
    Map<String, dynamic> json) {
  return _SendVerificationOtpModel.fromJson(json);
}

/// @nodoc
mixin _$SendVerificationOtpModel {
  String? get userName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this SendVerificationOtpModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendVerificationOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendVerificationOtpModelCopyWith<SendVerificationOtpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendVerificationOtpModelCopyWith<$Res> {
  factory $SendVerificationOtpModelCopyWith(SendVerificationOtpModel value,
          $Res Function(SendVerificationOtpModel) then) =
      _$SendVerificationOtpModelCopyWithImpl<$Res, SendVerificationOtpModel>;
  @useResult
  $Res call({String? userName, String? email});
}

/// @nodoc
class _$SendVerificationOtpModelCopyWithImpl<$Res,
        $Val extends SendVerificationOtpModel>
    implements $SendVerificationOtpModelCopyWith<$Res> {
  _$SendVerificationOtpModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendVerificationOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendVerificationOtpModelImplCopyWith<$Res>
    implements $SendVerificationOtpModelCopyWith<$Res> {
  factory _$$SendVerificationOtpModelImplCopyWith(
          _$SendVerificationOtpModelImpl value,
          $Res Function(_$SendVerificationOtpModelImpl) then) =
      __$$SendVerificationOtpModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userName, String? email});
}

/// @nodoc
class __$$SendVerificationOtpModelImplCopyWithImpl<$Res>
    extends _$SendVerificationOtpModelCopyWithImpl<$Res,
        _$SendVerificationOtpModelImpl>
    implements _$$SendVerificationOtpModelImplCopyWith<$Res> {
  __$$SendVerificationOtpModelImplCopyWithImpl(
      _$SendVerificationOtpModelImpl _value,
      $Res Function(_$SendVerificationOtpModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendVerificationOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
  }) {
    return _then(_$SendVerificationOtpModelImpl(
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendVerificationOtpModelImpl implements _SendVerificationOtpModel {
  const _$SendVerificationOtpModelImpl({this.userName, this.email});

  factory _$SendVerificationOtpModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendVerificationOtpModelImplFromJson(json);

  @override
  final String? userName;
  @override
  final String? email;

  @override
  String toString() {
    return 'SendVerificationOtpModel(userName: $userName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendVerificationOtpModelImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, email);

  /// Create a copy of SendVerificationOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendVerificationOtpModelImplCopyWith<_$SendVerificationOtpModelImpl>
      get copyWith => __$$SendVerificationOtpModelImplCopyWithImpl<
          _$SendVerificationOtpModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendVerificationOtpModelImplToJson(
      this,
    );
  }
}

abstract class _SendVerificationOtpModel implements SendVerificationOtpModel {
  const factory _SendVerificationOtpModel(
      {final String? userName,
      final String? email}) = _$SendVerificationOtpModelImpl;

  factory _SendVerificationOtpModel.fromJson(Map<String, dynamic> json) =
      _$SendVerificationOtpModelImpl.fromJson;

  @override
  String? get userName;
  @override
  String? get email;

  /// Create a copy of SendVerificationOtpModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendVerificationOtpModelImplCopyWith<_$SendVerificationOtpModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
