import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/domain/entities/failure/failure.dart';
import '../../../../core/services/adaptative.dart';
import '../../../../core/styles/colors.dart';
import '../../domain/entities/ball_reading.dart';
import '../bloc/ball_bloc.dart';

class Ball extends StatefulWidget {
  final VoidCallback onTap;
  const Ball({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> with TickerProviderStateMixin {
  late final AnimationController _animationFloatingController =
      AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 3000,
    ),
  )..repeat(reverse: true);
  late final AnimationController _animationOpacityController =
      AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 750,
    ),
  );
  late final AnimationController _animationShakeController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 100));
  late final Animation<Offset> _animationFloating = Tween(
    begin: Offset.zero,
    end: const Offset(
      0,
      0.05,
    ),
  ).animate(_animationFloatingController);
  late final Animation<Offset> _animationShake = Tween(
    begin: const Offset(
      -.015,
      0,
    ),
    end: const Offset(
      .015,
      0,
    ),
  ).animate(_animationShakeController);
  late final Animation<double> _animationOpacity =
      Tween(begin: 0.0, end: 1.0).animate(_animationOpacityController);

  @override
  void dispose() {
    _animationFloatingController.dispose();
    _animationShakeController.dispose();
    _animationOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BallBloc, BallState>(
      listener: (context, state) => state.maybeWhen(
        loading: () {
          _animationShakeController.repeat(reverse: true);
          _animationOpacityController.forward();
          return null;
        },
        failure: (_) {
          _animationShakeController.stop();
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
              SlideTransition(
                position: _animationFloating,
                child: SlideTransition(
                  position: _animationShake,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        height: Adaptive.isHandset
                            ? Adaptive.screenWidth!
                            : Adaptive.isTablet
                                ? Adaptive.screenWidth! * .8
                                : Adaptive.screenWidth! * .5,
                        width: Adaptive.isHandset
                            ? Adaptive.screenWidth!
                            : Adaptive.isTablet
                                ? Adaptive.screenWidth! * .8
                                : Adaptive.screenWidth! * .5,
                        image: const AssetImage(
                          Assets.ball,
                        ),
                      ),
                      state.maybeWhen(
                        loading: () => FadeTransition(
                          opacity: _animationOpacity,
                          child: Container(
                            height: Adaptive.isHandset
                                ? Adaptive.screenWidth! * .7
                                : Adaptive.isTablet
                                    ? Adaptive.screenWidth! * .8
                                    : Adaptive.screenWidth! * .5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Pallete.black.withOpacity(.75),
                                  blurRadius: 27,
                                  spreadRadius: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        loaded: (BallReading ballReading) => Container(
                          height: Adaptive.isHandset
                              ? Adaptive.screenWidth! * .7
                              : Adaptive.isTablet
                                  ? Adaptive.screenWidth! * .8
                                  : Adaptive.screenWidth! * .5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Pallete.black.withOpacity(.75),
                                blurRadius: 27,
                                spreadRadius: 8,
                              )
                            ],
                          ),
                          padding: EdgeInsets.all(Adaptive.isHandset
                              ? Adaptive.screenWidth! * .25
                              : Adaptive.isTablet
                                  ? Adaptive.screenWidth! * .2
                                  : Adaptive.screenWidth! * .1),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                ballReading.reading,
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
                        failure: (Failure failure) => FadeTransition(
                          opacity: _animationOpacity,
                          child: Container(
                            height: Adaptive.isHandset
                                ? Adaptive.screenWidth! * .7
                                : Adaptive.isTablet
                                    ? Adaptive.screenWidth! * .8
                                    : Adaptive.screenWidth! * .5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Pallete.red.withOpacity(.75),
                                  blurRadius: 27,
                                  spreadRadius: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: Adaptive.setPadding(20),
              ),
              state.maybeWhen(
                failure: (_) => Image.asset(
                  Assets.shadowError,
                ),
                orElse: () => Image.asset(
                  Assets.shadowDefault,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
