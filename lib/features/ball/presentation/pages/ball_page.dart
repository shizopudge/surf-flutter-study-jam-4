import 'package:flutter/material.dart';

import '../../../../core/services/adaptative.dart';
import '../../../../core/services/get_it.dart';
import '../../../../core/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_ball_reading.dart';

import '../../data/repositories/ball_repository_impl.dart';
import '../bloc/ball_bloc.dart';
import '../widgets/ball.dart';
import '../widgets/ball_shadow.dart';
import '../widgets/instructions.dart';

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    Adaptive.init(context);
    return BlocProvider(
      create: (context) => BallBloc(
        getBallReading: GetBallReading(
          getIt<BallRepositoryImpl>(),
        ),
      ),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Pallete.lighterPurple,
                Pallete.lightPurple,
                Pallete.darkPurple,
                Pallete.black,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Ball(
                key: const ValueKey<String>('ball'),
                onTap: () => context.read<BallBloc>().add(
                      const BallEvent.tapOnBall(),
                    ),
              ),
              SizedBox(
                height: Adaptive.setPadding(20),
              ),
              const BallShadow(
                key: ValueKey<String>('ball_shadow'),
              ),
              SizedBox(
                height: Adaptive.setPadding(20),
              ),
              const InstructionsText(
                key: ValueKey<String>('instruction_text'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
