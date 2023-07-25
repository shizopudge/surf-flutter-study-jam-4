import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/ball_reading.dart';
import '../repositories/ball_repository.dart';

class GetBallReading implements UseCase<BallReading, NoParams> {
  final BallRepository repository;

  const GetBallReading(this.repository);
  @override
  FutureEither<BallReading> call(NoParams params) async =>
      await repository.getBallReading();
}
