import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/data/models/restaurant_list.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../data/api/restaurant_service.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends HookConsumerWidget {
  HomeScreen({super.key});

  void _snapAppBar(ScrollController scrollController) {
    if (scrollController.offset > 200) {
      return;
    }
    if (scrollController.offset > 100) {
      Future.microtask(() => scrollController.animateTo(200,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn));
    } else {
      Future.microtask(() => scrollController.animateTo(0,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantListResponse = ref.watch(restaurantList);
    final scrollController = useScrollController();

    return Scaffold(
        body: NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        _snapAppBar(scrollController);
        return true;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          buildAppBar(),
          buildText(
              context: context,
              text: "Offers for you",
              padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
              showRightSide: true),
          buildRestaurantList(restaurantListResponse),
          buildText(
              context: context,
              text: "Popular Restaurants",
              padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
              showRightSide: true),
          buildRestaurantList(restaurantListResponse),
          buildBottomPage()
        ],
      ),
    ));
  }

  Widget buildRestaurantList(
      AsyncValue<RestaurantListResponse> restaurantListResponse) {
    return restaurantListResponse.when(
      data: (data) {
        return buildPage(restaurantListResponse);
      },
      loading: () => const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator())),
      error: (error, stackTrace) =>
          SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
    );
  }

  Widget buildText(
      {required BuildContext context,
      required String text,
      required EdgeInsets padding,
      bool showRightSide = false}) {
    // textheme
    final textTheme = Theme.of(context).textTheme;
    return SliverPadding(
        padding: padding,
        sliver: SliverList(
            delegate: SliverChildListDelegate([
          // text widget with Offers for you
          Row(
            children: [
              Text(
                text,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (showRightSide)
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ])));
  }

  Card buildCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Stack(
        children: [
          Container(
            height: 130,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: Image.asset("assets/images/5.png").image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(AsyncValue<RestaurantListResponse> restaurantListResponse) {
    return restaurantListResponse.when(
      data: (data) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 5, right: 16),
            child: SizedBox(
              height: 155,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.restaurants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildCard(),
                            Text(
                              '  ${data.restaurants[index].name}',
                              style: const TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )
                          ]),
                    );
                  }),
            ),
          ),
        );
      },
      loading: () => const Center(
          child: SliverToBoxAdapter(child: CircularProgressIndicator())),
      error: (error, stackTrace) =>
          SliverToBoxAdapter(child: Center(child: Text(error.toString()))),
    );
  }

  Widget buildBottomPage() {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://restaurant-api.dicoding.dev/images/medium/14'),
              ),
              title: Text('Restaurant Name'),
              subtitle: Text('Restaurant Address'),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
          );
        }),
        itemExtent: 100);
  }

  Widget buildAppBar() {
    return SliverAppBar(
        pinned: true,
        stretch: true,
        flexibleSpace: const AppHeader(maxHeight: 200, minHeight: 80),
        bottom: buildSearchBar(),
        expandedHeight: 200);
  }

  PreferredSize buildSearchBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40),
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            top: 40,
            child: ColoredBox(
                color: Colors.white,
                child: SizedBox.fromSize(size: const Size.fromHeight(40))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
