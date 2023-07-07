import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final int width;
  final int height;

  const Logo({super.key, this.width = 200, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: Image.asset('assets/images/Naato Meals Logo.png').image,
        fit: BoxFit.contain,
      )),
    );
  }
}
