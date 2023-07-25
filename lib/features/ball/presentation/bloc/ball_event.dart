part of 'ball_bloc.dart';

@freezed
class BallEvent with _$BallEvent {
  const factory BallEvent.tapOnBall() = _TapOnBall;
}
