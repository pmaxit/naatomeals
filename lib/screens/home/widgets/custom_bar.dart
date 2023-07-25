import 'package:flutter/material.dart';

class CustomAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget child;

  const CustomAppBar({
    required this.expandedHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => expandedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
