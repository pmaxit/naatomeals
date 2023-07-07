import 'package:flutter/material.dart';

class FoodImage extends StatelessWidget {
  final double start;
  final double y;
  final Image image;

  final double width;
  final double height;

  const FoodImage(
      {Key? key,
      this.start = 0,
      this.y = 0,
      required this.image,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional(start, y),
        child: Opacity(
          opacity: 0.7,
          child: Material(
            color: Colors.transparent,
            elevation: 4,
            shape: const CircleBorder(),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(fit: BoxFit.cover, image: image.image),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        color: Color.fromARGB(51, 195, 191, 191),
                        offset: Offset(0, 4))
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white)),
            ),
          ),
        ));
  }
}
