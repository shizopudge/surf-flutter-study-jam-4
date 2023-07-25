import 'package:flutter/material.dart';

import '../../../../core/services/adaptative.dart';
import '../../../../core/styles/colors.dart';

class BallInstructions extends StatelessWidget {
  const BallInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    Adaptive.init(context);
    if (Adaptive.deviceType.isMobile) {
      return Text(
        'Нажмите на шар\nили потрясите телефон',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Pallete.grey,
              fontSize: Adaptive.defaultTextSize,
            ),
      );
    } else if (Adaptive.deviceType.isTablet) {
      return Text(
        'Нажмите на шар\nили потрясите планшет',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Pallete.grey,
              fontSize: Adaptive.defaultTextSize,
            ),
      );
    }
    return FittedBox(
      child: Text(
        'Нажмите на шар',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Pallete.grey,
              fontSize: Adaptive.defaultTextSize,
            ),
      ),
    );
  }
}
