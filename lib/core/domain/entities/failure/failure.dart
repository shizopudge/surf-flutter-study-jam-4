import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.basicFailure({
    required String message,
  }) = BasicFailure;

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}
