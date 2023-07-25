import 'package:freezed_annotation/freezed_annotation.dart';

part 'ball_reading_model.freezed.dart';
part 'ball_reading_model.g.dart';

@freezed
class BallReadingModel with _$BallReadingModel {
  const factory BallReadingModel({
    required String reading,
  }) = _BallReadingModel;

  factory BallReadingModel.fromJson(Map<String, dynamic> json) =>
      _$BallReadingModelFromJson(json);
}
