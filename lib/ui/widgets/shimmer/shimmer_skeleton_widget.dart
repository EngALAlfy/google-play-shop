import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ShimmerSkeletonWidget extends StatelessWidget {
  const ShimmerSkeletonWidget({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [ShimmerEffect(duration: Duration(minutes: 1))],
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10 / 2),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
