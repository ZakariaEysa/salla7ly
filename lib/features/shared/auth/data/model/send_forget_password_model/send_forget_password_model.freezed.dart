// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_forget_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendForgetPasswordModel _$SendForgetPasswordModelFromJson(
    Map<String, dynamic> json) {
  return _SendForgetPasswordModel.fromJson(json);
}

/// @nodoc
mixin _$SendForgetPasswordModel {
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this SendForgetPasswordModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendForgetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendForgetPasswordModelCopyWith<SendForgetPasswordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendForgetPasswordModelCopyWith<$Res> {
  factory $SendForgetPasswordModelCopyWith(SendForgetPasswordModel value,
          $Res Function(SendForgetPasswordModel) then) =
      _$SendForgetPasswordModelCopyWithImpl<$Res, SendForgetPasswordModel>;
  @useResult
  $Res call({String? email});
}

/// @nodoc
class _$SendForgetPasswordModelCopyWithImpl<$Res,
        $Val extends SendForgetPasswordModel>
    implements $SendForgetPasswordModelCopyWith<$Res> {
  _$SendForgetPasswordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendForgetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendForgetPasswordModelImplCopyWith<$Res>
    implements $SendForgetPasswordModelCopyWith<$Res> {
  factory _$$SendForgetPasswordModelImplCopyWith(
          _$SendForgetPasswordModelImpl value,
          $Res Function(_$SendForgetPasswordModelImpl) then) =
      __$$SendForgetPasswordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email});
}

/// @nodoc
class __$$SendForgetPasswordModelImplCopyWithImpl<$Res>
    extends _$SendForgetPasswordModelCopyWithImpl<$Res,
        _$SendForgetPasswordModelImpl>
    implements _$$SendForgetPasswordModelImplCopyWith<$Res> {
  __$$SendForgetPasswordModelImplCopyWithImpl(
      _$SendForgetPasswordModelImpl _value,
      $Res Function(_$SendForgetPasswordModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SendForgetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_$SendForgetPasswordModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendForgetPasswordModelImpl implements _SendForgetPasswordModel {
  const _$SendForgetPasswordModelImpl({required this.email});

  factory _$SendForgetPasswordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendForgetPasswordModelImplFromJson(json);

  @override
  final String? email;

  @override
  String toString() {
    return 'SendForgetPasswordModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendForgetPasswordModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SendForgetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendForgetPasswordModelImplCopyWith<_$SendForgetPasswordModelImpl>
      get copyWith => __$$SendForgetPasswordModelImplCopyWithImpl<
          _$SendForgetPasswordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendForgetPasswordModelImplToJson(
      this,
    );
  }
}

abstract class _SendForgetPasswordModel implements SendForgetPasswordModel {
  const factory _SendForgetPasswordModel({required final String? email}) =
      _$SendForgetPasswordModelImpl;

  factory _SendForgetPasswordModel.fromJson(Map<String, dynamic> json) =
      _$SendForgetPasswordModelImpl.fromJson;

  @override
  String? get email;

  /// Create a copy of SendForgetPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendForgetPasswordModelImplCopyWith<_$SendForgetPasswordModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
