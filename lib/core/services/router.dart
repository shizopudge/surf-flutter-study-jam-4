import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/ball/data/repositories/ball_repository_impl.dart';
import '../../features/ball/domain/usecases/get_ball_reading.dart';
import '../../features/ball/presentation/bloc/ball_bloc.dart';
import '../../features/ball/presentation/pages/ball_page.dart';
import 'get_it.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) => BallBloc(
            getBallReadingUsecase: GetBallReading(
              getIt<BallRepositoryImpl>(),
            ),
          ),
          child: const BallPage(),
        ),
      ),
    ],
  );
}
