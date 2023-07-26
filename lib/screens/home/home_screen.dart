import 'package:flutter/material.dart';
import 'package:naatomeals/utils/styles.dart';

import 'widgets/restaurant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double searchTopBarPosition = 140;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        // get the current position
        final currentPixels = notification.metrics.pixels;
        if (currentPixels < 70) {
          setState(() {
            searchTopBarPosition = 140 - currentPixels;
          });
        }
        return true;
      },
      child: Stack(
        children: [
          CustomScrollView(
              slivers: [_buildAppBar2(context), _buildBody(context)]),
          _buildSearchBar(context)
        ],
      ),
    ));
  }

  Widget _buildSearchBar(BuildContext context) {
    return Positioned(
      left: 40,
      right: 20,
      top: searchTopBarPosition,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Theme.of(context).shadowColor,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'What are you carving for?',
            prefixIcon: Icon(Icons.search, color: orangeColor),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }

  Widget _build_heading(String heading, String subHeading) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          heading,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              subHeading,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.red,
                  ),
            ))
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const SizedBox(
        height: 40,
      ),
      _build_heading("Offers for you", "See all"),
      const SizedBox(
        height: 20,
      ),
      _build_restaurant_cards(),
      _build_heading("Offers for you", "See all"),
      const SizedBox(
        height: 20,
      ),
      _build_restaurant_cards(),
    ]));
  }

  Widget _build_restaurant_cards() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.black,
              child: Text("Restaurant"));
        },
      ),
    );
  }

  Widget _buildAppBar2(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      expandedHeight: 175,
      primary: false,
      pinned: true,
      collapsedHeight: 100,
      stretch: true,
      title: const Text("Naato Meals"),
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
