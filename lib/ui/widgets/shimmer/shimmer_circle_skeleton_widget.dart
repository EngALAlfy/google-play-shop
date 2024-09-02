import 'package:flutter/material.dart';

class ShimmerSkeletonCircleSkeletonWidget extends StatelessWidget {
  const ShimmerSkeletonCircleSkeletonWidget({super.key, this.size = 24});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
    );
  }
}