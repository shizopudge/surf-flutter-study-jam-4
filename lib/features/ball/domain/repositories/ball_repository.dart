import '../../../../core/constants/type_defs.dart';
import '../entities/ball_reading.dart';

abstract interface class BallRepository {
  FutureEither<BallReading> getBallReading();
}
