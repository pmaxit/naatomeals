import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/screens/home/widgets/cusine_card.dart';
import 'package:naatomeals/utils/styles.dart';

import '../../data/models/restaurant.dart';
import '../../services/restaurant_service.dart';
import '../profile/profile_screen.dart';
import 'bloc/home_cubit.dart';
import 'widgets/restaurant_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  double searchTopBarPosition = 140;
  int currentIndex = 0;
  late ScrollController _scrollController;

  void _scrollListener() {
    if (_scrollController.offset < 70) {
      setState(() {
        searchTopBarPosition = 140 - _scrollController.offset;
      });
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 1);
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  Widget _get_home_page(List<Restaurant> restaurants) {
    return Stack(
      children: [
        CustomScrollView(controller: _scrollController, slivers: [
          _buildAppBar2(context),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: _buildBody(context, restaurants)),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: _build_restaurant_list(restaurants)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.red,
            ),
          )
        ]),
        _buildSearchBar(context)
      ],
    );
  }

  Map<int, Widget> getMappings(List<Restaurant> restaurants) {
    return {
      0: _get_home_page(restaurants),
      1: _get_home_page(restaurants),
      2: _get_home_page(restaurants),
      3: const ProfileScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(ref.read(apiProvider))..getRestaurants(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            print("state is: $state");
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isLoading == false &&
                state.restaurants.isNotEmpty) {
              return getMappings(state.restaurants.toList())[currentIndex]!;
            } else if (state.error != null) {
              return Center(
                  child:
                      Text(state.error!, style: TextStyle(color: Colors.red)));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: orangeColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Orders'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Messages'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
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
        Text(heading,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
        TextButton(
            onPressed: () {},
            child: Text(
              subHeading,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ))
      ],
    );
  }

  Widget _buildBody(BuildContext context, List<Restaurant> restaurants) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const SizedBox(
        height: 40,
      ),
      _build_heading("Offers for you", "See all"),
      const SizedBox(
        height: 20,
      ),
      _build_restaurant_cards(restaurants),
      const SizedBox(
        height: 20,
      ),
      _build_heading("What's on your mind?", "See all"),

      const SizedBox(
        height: 20,
      ),

      _build_cusine_lists(),
      const SizedBox(
        height: 20,
      ),
      _build_heading("Top Kitchen's Near You", "See all"),
      const SizedBox(
        height: 20,
      ),
      //_build_restaurant_cards(),
    ]));
  }

  Widget _build_cusine_lists() {
    return SizedBox(
        height: 75,
        child: ListView.builder(
          itemExtent: 70,
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CuisineCard());
          },
        ));
  }

  Widget _build_restaurant_cards(List<Restaurant> restaurants) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemExtent: 185,
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'restaurant_page');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: RestaurantCard(
                restaurant: restaurants[index],
                offerMessage: index % 2 != 0 ? null : "50% Off",
              ),
            ),
          );
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

  Widget _build_restaurant_list(List<Restaurant> restaurants) {
    return SliverFixedExtentList(
        itemExtent: 85,
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      restaurants[index].name,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      " Speciality: Punjabi",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.add_location,
                          color: orangeColor,
                          size: 16,
                        ),
                        Text(
                          "3.5 Km Away",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ])
            ]),
          );
        }, childCount: restaurants.length));
  }
}
