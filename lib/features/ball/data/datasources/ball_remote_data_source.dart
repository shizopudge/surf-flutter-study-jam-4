import '../../../../core/domain/entities/failure/failure.dart';
import '../../../../core/services/dio.dart';
import '../models/ball_response/ball_reading_model.dart';

abstract interface class BallRemoteDataSource {
  Future<BallReadingModel> getBallReading();
}

class BallRemoteDataSourceImpl implements BallRemoteDataSource {
  final DioClient dioClient;

  const BallRemoteDataSourceImpl(this.dioClient);

  @override
  Future<BallReadingModel> getBallReading() async {
    try {
      final res = await dioClient.get(
        '/',
      );
      return BallReadingModel.fromJson(res.data);
    } catch (e) {
      throw BasicFailure(message: e.toString());
    }
  }
}
