part of 'ball_bloc.dart';

@freezed
class BallState with _$BallState {
  const factory BallState.initial() = _InitialState;
  const factory BallState.loading() = _LoadingState;
  const factory BallState.loaded(BallReading reading) = _LoadedState;
  const factory BallState.failure(Failure failure) = _ErrorState;
}
