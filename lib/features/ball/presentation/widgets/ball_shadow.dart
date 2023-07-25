import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';

class BallShadow extends StatelessWidget {
  final double height;
  final Color? color;
  final EdgeInsets? padding;
  final Widget? child;
  const BallShadow({
    super.key,
    required this.height,
    this.color,
    this.padding,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color ?? Pallete.black.withOpacity(.75),
            blurRadius: 27,
            spreadRadius: 8,
          )
        ],
      ),
      child: child,
    );
  }
}
