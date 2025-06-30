// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserAuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthStateCopyWith<$Res> {
  factory $UserAuthStateCopyWith(
          UserAuthState value, $Res Function(UserAuthState) then) =
      _$UserAuthStateCopyWithImpl<$Res, UserAuthState>;
}

/// @nodoc
class _$UserAuthStateCopyWithImpl<$Res, $Val extends UserAuthState>
    implements $UserAuthStateCopyWith<$Res> {
  _$UserAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthInitialImplCopyWith<$Res> {
  factory _$$AuthInitialImplCopyWith(
          _$AuthInitialImpl value, $Res Function(_$AuthInitialImpl) then) =
      __$$AuthInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitialImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$AuthInitialImpl>
    implements _$$AuthInitialImplCopyWith<$Res> {
  __$$AuthInitialImplCopyWithImpl(
      _$AuthInitialImpl _value, $Res Function(_$AuthInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthInitialImpl implements AuthInitial {
  const _$AuthInitialImpl();

  @override
  String toString() {
    return 'UserAuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements UserAuthState {
  const factory AuthInitial() = _$AuthInitialImpl;
}

/// @nodoc
abstract class _$$OtpLoadingStateImplCopyWith<$Res> {
  factory _$$OtpLoadingStateImplCopyWith(_$OtpLoadingStateImpl value,
          $Res Function(_$OtpLoadingStateImpl) then) =
      __$$OtpLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpLoadingStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$OtpLoadingStateImpl>
    implements _$$OtpLoadingStateImplCopyWith<$Res> {
  __$$OtpLoadingStateImplCopyWithImpl(
      _$OtpLoadingStateImpl _value, $Res Function(_$OtpLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpLoadingStateImpl implements OtpLoadingState {
  const _$OtpLoadingStateImpl();

  @override
  String toString() {
    return 'UserAuthState.otpLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) {
    return otpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) {
    return otpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) {
    if (otpLoading != null) {
      return otpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) {
    return otpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) {
    return otpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) {
    if (otpLoading != null) {
      return otpLoading(this);
    }
    return orElse();
  }
}

abstract class OtpLoadingState implements UserAuthState {
  const factory OtpLoadingState() = _$OtpLoadingStateImpl;
}

/// @nodoc
abstract class _$$OtpSuccessStateImplCopyWith<$Res> {
  factory _$$OtpSuccessStateImplCopyWith(_$OtpSuccessStateImpl value,
          $Res Function(_$OtpSuccessStateImpl) then) =
      __$$OtpSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtpSuccessStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$OtpSuccessStateImpl>
    implements _$$OtpSuccessStateImplCopyWith<$Res> {
  __$$OtpSuccessStateImplCopyWithImpl(
      _$OtpSuccessStateImpl _value, $Res Function(_$OtpSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OtpSuccessStateImpl implements OtpSuccessState {
  const _$OtpSuccessStateImpl();

  @override
  String toString() {
    return 'UserAuthState.otpSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtpSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) {
    return otpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) {
    return otpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) {
    if (otpSuccess != null) {
      return otpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) {
    return otpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) {
    return otpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) {
    if (otpSuccess != null) {
      return otpSuccess(this);
    }
    return orElse();
  }
}

abstract class OtpSuccessState implements UserAuthState {
  const factory OtpSuccessState() = _$OtpSuccessStateImpl;
}

/// @nodoc
abstract class _$$SignUpLoadingStateImplCopyWith<$Res> {
  factory _$$SignUpLoadingStateImplCopyWith(_$SignUpLoadingStateImpl value,
          $Res Function(_$SignUpLoadingStateImpl) then) =
      __$$SignUpLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpLoadingStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$SignUpLoadingStateImpl>
    implements _$$SignUpLoadingStateImplCopyWith<$Res> {
  __$$SignUpLoadingStateImplCopyWithImpl(_$SignUpLoadingStateImpl _value,
      $Res Function(_$SignUpLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpLoadingStateImpl implements SignUpLoadingState {
  const _$SignUpLoadingStateImpl();

  @override
  String toString() {
    return 'UserAuthState.signUpLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) {
    return signUpLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) {
    return signUpLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) {
    return signUpLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) {
    return signUpLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpLoading != null) {
      return signUpLoading(this);
    }
    return orElse();
  }
}

abstract class SignUpLoadingState implements UserAuthState {
  const factory SignUpLoadingState() = _$SignUpLoadingStateImpl;
}

/// @nodoc
abstract class _$$SignUpSuccessStateImplCopyWith<$Res> {
  factory _$$SignUpSuccessStateImplCopyWith(_$SignUpSuccessStateImpl value,
          $Res Function(_$SignUpSuccessStateImpl) then) =
      __$$SignUpSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignUpSuccessStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$SignUpSuccessStateImpl>
    implements _$$SignUpSuccessStateImplCopyWith<$Res> {
  __$$SignUpSuccessStateImplCopyWithImpl(_$SignUpSuccessStateImpl _value,
      $Res Function(_$SignUpSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignUpSuccessStateImpl implements SignUpSuccessState {
  const _$SignUpSuccessStateImpl();

  @override
  String toString() {
    return 'UserAuthState.signUpSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignUpSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) {
    return signUpSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) {
    return signUpSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) {
    return signUpSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) {
    return signUpSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpSuccess != null) {
      return signUpSuccess(this);
    }
    return orElse();
  }
}

abstract class SignUpSuccessState implements UserAuthState {
  const factory SignUpSuccessState() = _$SignUpSuccessStateImpl;
}

/// @nodoc
abstract class _$$SignUpErrorStateImplCopyWith<$Res> {
  factory _$$SignUpErrorStateImplCopyWith(_$SignUpErrorStateImpl value,
          $Res Function(_$SignUpErrorStateImpl) then) =
      __$$SignUpErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SignUpErrorStateImplCopyWithImpl<$Res>
    extends _$UserAuthStateCopyWithImpl<$Res, _$SignUpErrorStateImpl>
    implements _$$SignUpErrorStateImplCopyWith<$Res> {
  __$$SignUpErrorStateImplCopyWithImpl(_$SignUpErrorStateImpl _value,
      $Res Function(_$SignUpErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SignUpErrorStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpErrorStateImpl implements SignUpErrorState {
  const _$SignUpErrorStateImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'UserAuthState.signUpError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpErrorStateImplCopyWith<_$SignUpErrorStateImpl> get copyWith =>
      __$$SignUpErrorStateImplCopyWithImpl<_$SignUpErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() otpLoading,
    required TResult Function() otpSuccess,
    required TResult Function() signUpLoading,
    required TResult Function() signUpSuccess,
    required TResult Function(String message) signUpError,
  }) {
    return signUpError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? otpLoading,
    TResult? Function()? otpSuccess,
    TResult? Function()? signUpLoading,
    TResult? Function()? signUpSuccess,
    TResult? Function(String message)? signUpError,
  }) {
    return signUpError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? otpLoading,
    TResult Function()? otpSuccess,
    TResult Function()? signUpLoading,
    TResult Function()? signUpSuccess,
    TResult Function(String message)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpError != null) {
      return signUpError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthInitial value) initial,
    required TResult Function(OtpLoadingState value) otpLoading,
    required TResult Function(OtpSuccessState value) otpSuccess,
    required TResult Function(SignUpLoadingState value) signUpLoading,
    required TResult Function(SignUpSuccessState value) signUpSuccess,
    required TResult Function(SignUpErrorState value) signUpError,
  }) {
    return signUpError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthInitial value)? initial,
    TResult? Function(OtpLoadingState value)? otpLoading,
    TResult? Function(OtpSuccessState value)? otpSuccess,
    TResult? Function(SignUpLoadingState value)? signUpLoading,
    TResult? Function(SignUpSuccessState value)? signUpSuccess,
    TResult? Function(SignUpErrorState value)? signUpError,
  }) {
    return signUpError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthInitial value)? initial,
    TResult Function(OtpLoadingState value)? otpLoading,
    TResult Function(OtpSuccessState value)? otpSuccess,
    TResult Function(SignUpLoadingState value)? signUpLoading,
    TResult Function(SignUpSuccessState value)? signUpSuccess,
    TResult Function(SignUpErrorState value)? signUpError,
    required TResult orElse(),
  }) {
    if (signUpError != null) {
      return signUpError(this);
    }
    return orElse();
  }
}

abstract class SignUpErrorState implements UserAuthState {
  const factory SignUpErrorState({required final String message}) =
      _$SignUpErrorStateImpl;

  String get message;

  /// Create a copy of UserAuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpErrorStateImplCopyWith<_$SignUpErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
