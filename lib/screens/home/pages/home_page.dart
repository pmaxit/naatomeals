import 'package:flutter/material.dart';
import 'package:naatomeals/screens/home/widgets/heading.dart';

import '../../../data/models/restaurant.dart';
import '../widgets/app_bar.dart';
import '../widgets/cuisines.dart';
import '../widgets/offers.dart';
import '../widgets/restaurant_list.dart';

class HomePage extends StatefulWidget {
  final List<Restaurant> restaurants;
  const HomePage({super.key, required this.restaurants});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  double searchTopBarPosition = 140;
  int currentIndex = 0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 1);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.offset < 70) {
      setState(() {
        searchTopBarPosition = 140 - _scrollController.offset;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(controller: _scrollController, slivers: [
          const MyAppBar(),
          SliverPadding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              sliver: Offers(restaurants: widget.restaurants)),
          const SliverPadding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              sliver: CuisineList()),
          const SliverPadding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 20),
            sliver: SliverToBoxAdapter(
                child: HeadingOptions(
                    heading: "Popular Restaurants", subHeading: "")),
          ),
          SliverPadding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 4),
              sliver: RestaurantList(restaurants: widget.restaurants)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.red,
            ),
          )
        ]),
      ],
    );
  }
}
