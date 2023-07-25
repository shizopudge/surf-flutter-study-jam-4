import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/adaptative.dart';
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

class _BallState extends State<Ball> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 3000,
    ),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation = Tween(
    begin: Offset.zero,
    end: const Offset(
      0,
      0.05,
    ),
  ).animate(_animationController);

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ballState = context.watch<BallBloc>().state;
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onTap: widget.onTap,
        child: ballState.when(
          initial: () {
            return Image.asset(
              'assets/images/ball.png',
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
            );
          },
          loading: () {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/ball.png',
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
                ),
              ],
            );
          },
          loaded: (ballReading) {
            return Image.asset(
              'assets/images/ball.png',
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
            );
          },
          failure: (failure) {
            return Image.asset(
              'assets/images/ball.png',
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
            );
          },
        ),
      ),
    );
  }
}
