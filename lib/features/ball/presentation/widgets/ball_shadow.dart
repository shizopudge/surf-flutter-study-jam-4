import 'package:flutter/material.dart';

import '../../../../core/services/adaptative.dart';

class BallShadow extends StatelessWidget {
  const BallShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/shadowDefault.png',
      width: Adaptive.isHandset
          ? Adaptive.screenWidth! * .9
          : Adaptive.isTablet
              ? Adaptive.screenWidth! * .8
              : Adaptive.screenWidth! * .5,
    );
  }
}
