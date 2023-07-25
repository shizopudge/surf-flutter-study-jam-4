import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/animations/fade_animation_y_down.dart';

import '../../../../core/services/adaptative.dart';
import '../../../../core/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/ball_bloc.dart';
import '../widgets/ball.dart';
import '../widgets/ball_instructions.dart';

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  late final ShakeDetector _shakeDetector;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    _shakeDetector = ShakeDetector.autoStart(
      onPhoneShake: () =>
          context.read<BallBloc>().add(const BallEvent.getBallReading()),
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    super.initState();
  }

  @override
  void deactivate() {
    _shakeDetector.stopListening();
    super.deactivate();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Adaptive.init(context);
    return BlocListener<BallBloc, BallState>(
      listener: (context, state) => state.whenOrNull(
        failure: (_) => _audioPlayer.play(
          AssetSource(
            Assets.failureSound,
          ),
        ),
        loaded: (_) => _audioPlayer.play(
          AssetSource(
            Assets.failureSound,
          ),
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
              FadeAnimationYDown(
                delay: .4,
                child: Ball(
                  key: const ValueKey<String>('ball'),
                  onTap: () => context.read<BallBloc>().add(
                        const BallEvent.getBallReading(),
                      ),
                ),
              ),
              SizedBox(
                height: Adaptive.setPadding(20),
              ),
              const FadeAnimationYDown(
                delay: .5,
                child: BallInstructions(
                  key: ValueKey<String>('instruction_text'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
