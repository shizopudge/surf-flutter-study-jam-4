import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/entities/failure/failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../domain/entities/ball_reading.dart';
import '../../domain/usecases/get_ball_reading.dart';

part 'ball_event.dart';
part 'ball_state.dart';
part 'ball_bloc.freezed.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  BallBloc({required GetBallReading getBallReading})
      : _getBallReading = getBallReading,
        super(const _LoadingState()) {
    on<_TapOnBall>(_tapOnBall);
  }

  final GetBallReading _getBallReading;

  FutureOr<void> _tapOnBall(_TapOnBall event, Emitter<BallState> emit) async {
    if (state is! _LoadingState) {
      emit(const _LoadingState());
      final Either<Failure, BallReading> res =
          await _getBallReading.call(NoParams());
      res.fold(
        (Failure failure) => emit(
          _ErrorState(failure),
        ),
        (BallReading ballReading) => emit(
          _LoadedState(ballReading),
        ),
      );
    }
  }
}
