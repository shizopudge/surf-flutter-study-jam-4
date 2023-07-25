import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../features/ball/data/datasources/ball_remote_data_source.dart';
import '../../features/ball/data/repositories/ball_repository_impl.dart';
import 'dio.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(InternetConnection());

  // Repositories
  getIt.registerSingleton(BallRepositoryImpl(
      remoteDataSource: BallRemoteDataSourceImpl(getIt<DioClient>())));
}
