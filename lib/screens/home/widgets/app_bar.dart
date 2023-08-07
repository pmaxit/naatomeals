import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  SliverAppBar build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      expandedHeight: 175,
      primary: false,
      pinned: true,
      collapsedHeight: 100,
      stretch: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
          background:
              Stack(fit: StackFit.expand, clipBehavior: Clip.none, children: [
        Positioned(
            left: 24,
            top: 83,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Deliver To",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                "123 Main St. Dallas, TX",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              )
            ])),
        Positioned(
          // 264 to percentage of width of 430

          left: MediaQuery.of(context).size.width * 264.0 / 430.0,
          top: -20,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/vector.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      ])),
    );
  }
}
