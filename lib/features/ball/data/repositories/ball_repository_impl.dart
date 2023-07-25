import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/failure/failure.dart';
import '../../domain/entities/ball_reading.dart';
import '../../domain/repositories/ball_repository.dart';
import '../datasources/ball_remote_data_source.dart';

class BallRepositoryImpl implements BallRepository {
  final BallRemoteDataSource remoteDataSource;

  const BallRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  FutureEither<BallReading> getBallReading() async {
    try {
      final res = await remoteDataSource.getBallReading();
      final ballReading = BallReading.fromModel(res);
      return Right(ballReading);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(BasicFailure(message: e.toString()));
    }
  }
}
