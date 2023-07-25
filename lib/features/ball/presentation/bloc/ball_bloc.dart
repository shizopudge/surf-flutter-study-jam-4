import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entities/failure/failure.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../domain/entities/ball_reading.dart';
import '../../domain/usecases/get_ball_reading.dart';

part 'ball_bloc.freezed.dart';
part 'ball_event.dart';
part 'ball_state.dart';

class BallBloc extends Bloc<BallEvent, BallState> {
  BallBloc({required GetBallReading getBallReadingUsecase})
      : _getBallReadingUsecase = getBallReadingUsecase,
        super(const _InitialState()) {
    on<_GetBallReading>(_getBallReading);
  }

  final GetBallReading _getBallReadingUsecase;

  FutureOr<void> _getBallReading(
      _GetBallReading event, Emitter<BallState> emit) async {
    if (state is! _LoadingState) {
      emit(const _LoadingState());
      final Either<Failure, BallReading> res =
          await _getBallReadingUsecase.call(NoParams());
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
