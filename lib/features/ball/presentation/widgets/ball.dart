import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/domain/entities/failure/failure.dart';
import '../../../../core/services/adaptative.dart';
import '../../../../core/services/internet_connection_check/internet_connection_check_cubit.dart';
import '../../../../core/styles/colors.dart';
import '../../domain/entities/ball_reading.dart';
import '../bloc/ball_bloc.dart';
import 'ball_shadow.dart';

class Ball extends StatefulWidget {
  final VoidCallback onTap;
  final double height;
  const Ball({
    Key? key,
    required this.onTap,
    required this.height,
  }) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> with TickerProviderStateMixin {
  late final AnimationController _animationFloatingController =
      AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 2500,
    ),
  )..repeat(
          reverse: true,
        );

  late final AnimationController _animationOpacityController =
      AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 550,
    ),
  );
  late final AnimationController _animationShakeController =
      AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 150,
    ),
  );

  late final Animation<Offset> _animationFloating = Tween(
    begin: Offset.zero,
    end: const Offset(
      0,
      0.05,
    ),
  ).animate(
    _animationFloatingController,
  );

  late final Animation<Offset> _animationShake = Tween(
    begin: const Offset(
      0,
      -0.08,
    ),
    end: const Offset(
      0,
      .012,
    ),
  ).animate(
    _animationShakeController,
  );

  late final Animation<double> _animationOpacity =
      Tween(begin: 0.0, end: 1.0).animate(
    _animationOpacityController,
  );

  @override
  void dispose() {
    _animationFloatingController.dispose();
    _animationShakeController.dispose();
    _animationOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final internetState = context.watch<InternetConnectionCheckCubit>().state;
    return BlocConsumer<BallBloc, BallState>(
      listener: (context, state) => state.maybeWhen(
        loading: () {
          _animationShakeController.repeat(reverse: true);
          _animationOpacityController.forward();
          return null;
        },
        failure: (_) {
          _animationShakeController
            ..reset()
            ..stop();
          _animationOpacityController.forward();
          return null;
        },
        orElse: () {
          _animationShakeController.stop();
          _animationOpacityController
            ..reset()
            ..stop();
          return null;
        },
      ),
      builder: (context, state) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Column(
            children: [
              if (internetState ==
                  const InternetConnectionCheckState.disconnected())
                Column(
                  children: [
                    const Icon(
                      Icons.wifi_off_rounded,
                      color: Pallete.white,
                    ),
                    SizedBox(
                      height: Adaptive.setPadding(8),
                    ),
                    Text(
                      'NO INTERNET CONNECTION',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Pallete.white,
                            fontSize: Adaptive.defaultTextSize,
                          ),
                    ),
                    SizedBox(
                      height: Adaptive.setPadding(20),
                    ),
                  ],
                )
              else
                SlideTransition(
                  position: _animationFloating,
                  child: SlideTransition(
                    position: _animationShake,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image(
                          height: widget.height,
                          fit: BoxFit.cover,
                          image: const AssetImage(
                            Assets.ball,
                          ),
                        ),
                        state.maybeWhen(
                          loading: () => FadeTransition(
                            opacity: _animationOpacity,
                            child: BallShadow(height: widget.height * .7),
                          ),
                          loaded: (BallReading ballReading) => BallShadow(
                            height: widget.height * .7,
                            padding: EdgeInsets.all(
                              widget.height * .18,
                            ),
                            child: Center(
                              child: FittedBox(
                                child: TweenAnimationBuilder(
                                  tween: Tween(begin: 15.0, end: 0.0),
                                  duration: const Duration(milliseconds: 550),
                                  builder: (context, value, child) =>
                                      ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                        sigmaX: value, sigmaY: value),
                                    child: Text(
                                      ballReading.reading,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                            color: Pallete.white,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          failure: (Failure failure) => FadeTransition(
                            opacity: _animationOpacity,
                            child: BallShadow(
                              height: widget.height * .7,
                              color: Pallete.red.withOpacity(.75),
                            ),
                          ),
                          orElse: () => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              state.maybeWhen(
                failure: (_) => Image.asset(
                  Assets.shadowError,
                  height: widget.height * .18,
                  fit: BoxFit.cover,
                ),
                orElse: () => Image.asset(
                  Assets.shadowDefault,
                  height: widget.height * .18,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
