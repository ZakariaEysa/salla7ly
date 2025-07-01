// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_sign_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoogleSignInModel _$GoogleSignInModelFromJson(Map<String, dynamic> json) {
  return _GoogleSignInModel.fromJson(json);
}

/// @nodoc
mixin _$GoogleSignInModel {
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this GoogleSignInModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoogleSignInModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoogleSignInModelCopyWith<GoogleSignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInModelCopyWith<$Res> {
  factory $GoogleSignInModelCopyWith(
          GoogleSignInModel value, $Res Function(GoogleSignInModel) then) =
      _$GoogleSignInModelCopyWithImpl<$Res, GoogleSignInModel>;
  @useResult
  $Res call({String? email, String? name});
}

/// @nodoc
class _$GoogleSignInModelCopyWithImpl<$Res, $Val extends GoogleSignInModel>
    implements $GoogleSignInModelCopyWith<$Res> {
  _$GoogleSignInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoogleSignInModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleSignInModelImplCopyWith<$Res>
    implements $GoogleSignInModelCopyWith<$Res> {
  factory _$$GoogleSignInModelImplCopyWith(_$GoogleSignInModelImpl value,
          $Res Function(_$GoogleSignInModelImpl) then) =
      __$$GoogleSignInModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? email, String? name});
}

/// @nodoc
class __$$GoogleSignInModelImplCopyWithImpl<$Res>
    extends _$GoogleSignInModelCopyWithImpl<$Res, _$GoogleSignInModelImpl>
    implements _$$GoogleSignInModelImplCopyWith<$Res> {
  __$$GoogleSignInModelImplCopyWithImpl(_$GoogleSignInModelImpl _value,
      $Res Function(_$GoogleSignInModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GoogleSignInModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
  }) {
    return _then(_$GoogleSignInModelImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoogleSignInModelImpl implements _GoogleSignInModel {
  const _$GoogleSignInModelImpl({required this.email, required this.name});

  factory _$GoogleSignInModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoogleSignInModelImplFromJson(json);

  @override
  final String? email;
  @override
  final String? name;

  @override
  String toString() {
    return 'GoogleSignInModel(email: $email, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, name);

  /// Create a copy of GoogleSignInModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInModelImplCopyWith<_$GoogleSignInModelImpl> get copyWith =>
      __$$GoogleSignInModelImplCopyWithImpl<_$GoogleSignInModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoogleSignInModelImplToJson(
      this,
    );
  }
}

abstract class _GoogleSignInModel implements GoogleSignInModel {
  const factory _GoogleSignInModel(
      {required final String? email,
      required final String? name}) = _$GoogleSignInModelImpl;

  factory _GoogleSignInModel.fromJson(Map<String, dynamic> json) =
      _$GoogleSignInModelImpl.fromJson;

  @override
  String? get email;
  @override
  String? get name;

  /// Create a copy of GoogleSignInModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoogleSignInModelImplCopyWith<_$GoogleSignInModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
