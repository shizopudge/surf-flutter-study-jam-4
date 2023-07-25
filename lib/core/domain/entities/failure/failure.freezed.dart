// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Failure _$FailureFromJson(Map<String, dynamic> json) {
  return BasicFailure.fromJson(json);
}

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) basicFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? basicFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? basicFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicFailure value) basicFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BasicFailure value)? basicFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicFailure value)? basicFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasicFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$BasicFailureCopyWith(
          _$BasicFailure value, $Res Function(_$BasicFailure) then) =
      __$$BasicFailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BasicFailureCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BasicFailure>
    implements _$$BasicFailureCopyWith<$Res> {
  __$$BasicFailureCopyWithImpl(
      _$BasicFailure _value, $Res Function(_$BasicFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BasicFailure(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasicFailure implements BasicFailure {
  const _$BasicFailure({required this.message});

  factory _$BasicFailure.fromJson(Map<String, dynamic> json) =>
      _$$BasicFailureFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.basicFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasicFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicFailureCopyWith<_$BasicFailure> get copyWith =>
      __$$BasicFailureCopyWithImpl<_$BasicFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) basicFailure,
  }) {
    return basicFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? basicFailure,
  }) {
    return basicFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? basicFailure,
    required TResult orElse(),
  }) {
    if (basicFailure != null) {
      return basicFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BasicFailure value) basicFailure,
  }) {
    return basicFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BasicFailure value)? basicFailure,
  }) {
    return basicFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BasicFailure value)? basicFailure,
    required TResult orElse(),
  }) {
    if (basicFailure != null) {
      return basicFailure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BasicFailureToJson(
      this,
    );
  }
}

abstract class BasicFailure implements Failure {
  const factory BasicFailure({required final String message}) = _$BasicFailure;

  factory BasicFailure.fromJson(Map<String, dynamic> json) =
      _$BasicFailure.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$BasicFailureCopyWith<_$BasicFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
