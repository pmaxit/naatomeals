import 'package:flutter/material.dart';

class CuisineCard extends StatelessWidget {
  final double radius = 40;
  final double height = 60;
  const CuisineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius)),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/1.png'),
                radius: radius,
              )),
        ),
        Text('Punjabi',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
