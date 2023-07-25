// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ball_reading_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BallReadingModel _$BallReadingModelFromJson(Map<String, dynamic> json) {
  return _BallReadingModel.fromJson(json);
}

/// @nodoc
mixin _$BallReadingModel {
  String get reading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BallReadingModelCopyWith<BallReadingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BallReadingModelCopyWith<$Res> {
  factory $BallReadingModelCopyWith(
          BallReadingModel value, $Res Function(BallReadingModel) then) =
      _$BallReadingModelCopyWithImpl<$Res, BallReadingModel>;
  @useResult
  $Res call({String reading});
}

/// @nodoc
class _$BallReadingModelCopyWithImpl<$Res, $Val extends BallReadingModel>
    implements $BallReadingModelCopyWith<$Res> {
  _$BallReadingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
  }) {
    return _then(_value.copyWith(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BallReadingModelCopyWith<$Res>
    implements $BallReadingModelCopyWith<$Res> {
  factory _$$_BallReadingModelCopyWith(
          _$_BallReadingModel value, $Res Function(_$_BallReadingModel) then) =
      __$$_BallReadingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reading});
}

/// @nodoc
class __$$_BallReadingModelCopyWithImpl<$Res>
    extends _$BallReadingModelCopyWithImpl<$Res, _$_BallReadingModel>
    implements _$$_BallReadingModelCopyWith<$Res> {
  __$$_BallReadingModelCopyWithImpl(
      _$_BallReadingModel _value, $Res Function(_$_BallReadingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
  }) {
    return _then(_$_BallReadingModel(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BallReadingModel implements _BallReadingModel {
  const _$_BallReadingModel({required this.reading});

  factory _$_BallReadingModel.fromJson(Map<String, dynamic> json) =>
      _$$_BallReadingModelFromJson(json);

  @override
  final String reading;

  @override
  String toString() {
    return 'BallReadingModel(reading: $reading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BallReadingModel &&
            (identical(other.reading, reading) || other.reading == reading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BallReadingModelCopyWith<_$_BallReadingModel> get copyWith =>
      __$$_BallReadingModelCopyWithImpl<_$_BallReadingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BallReadingModelToJson(
      this,
    );
  }
}

abstract class _BallReadingModel implements BallReadingModel {
  const factory _BallReadingModel({required final String reading}) =
      _$_BallReadingModel;

  factory _BallReadingModel.fromJson(Map<String, dynamic> json) =
      _$_BallReadingModel.fromJson;

  @override
  String get reading;
  @override
  @JsonKey(ignore: true)
  _$$_BallReadingModelCopyWith<_$_BallReadingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
