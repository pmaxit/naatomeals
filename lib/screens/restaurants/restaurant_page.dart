import 'package:flutter/material.dart';
import 'package:naatomeals/screens/restaurants/widgets/image_slider.dart';
import 'package:naatomeals/utils/styles.dart';

import '../../data/models/menu.dart';
import '../../data/models/restaurant.dart';
import 'widgets/menu.dart';
import 'widgets/menuList.dart';

class RestaurantsDetailPage extends StatefulWidget {
  const RestaurantsDetailPage({super.key});

  @override
  State<RestaurantsDetailPage> createState() => _RestaurantsDetailPageState();
}

class _RestaurantsDetailPageState extends State<RestaurantsDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  int _selectedTabIndex = 0;
  late Restaurant restaurant;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    restaurant = args['restaurant'] as Restaurant;
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
        vsync: this,
        value: 1,
        upperBound: 1,
        duration: const Duration(milliseconds: 700));

    _tabController.addListener(_tabControllerListener);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabControllerListener);
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _tabControllerListener() {
    if (_tabController.indexIsChanging) {
      setState(() {
        print(' starting animation again ');
        _animationController.forward(from: 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // get restaurant here from argument

    return Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          title: Text(restaurant.name,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          backgroundColor: Colors.transparent,
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSlider(),
                  const SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text("About",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(restaurant.description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            )),
                  ),
                  const SizedBox(height: 20),
                  _getTabBar(context),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: _getDeliveryWidget()),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: _getSubscribeButton()),
                  const SizedBox(height: 20),
                ]),
          ),
        ));
  }

  Widget _getSubscribeButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Center(child: Text("Subscribe")),
    );
  }

  List<MenuItem> getMenuByCategory(List<MenuItem> menuItems, String category) {
    return menuItems
        .where((element) => element.category == category.toLowerCase())
        .toList();
  }

  Widget _getDeliveryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Deliver To",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
        Text("123 Main St, Dallas, TX",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey[500],
                )),
        Divider(
          color: Colors.grey[500],
          height: 4,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[500],
                    )),
            Text("\$ 20  ",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _getTabBar(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: orangeColor,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        tabs: const [
          Tab(
            child: Text("Breakfast", style: TextStyle(fontSize: 20)),
          ),
          Tab(
            child: Text("Lunch", style: TextStyle(fontSize: 20)),
          ),
          Tab(
            child: Text("Dinner", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
      const SizedBox(height: 20),
      SizedBox(
        height: 300,
        child: TabBarView(controller: _tabController, children: [
          // Icon
          RestaurantMenuList(
              menu: getMenuByCategory(restaurant.menu.items, "Breakfast")),
          RestaurantMenuList(
              menu: getMenuByCategory(restaurant.menu.items, "Lunch")),
          RestaurantMenuList(
              menu: getMenuByCategory(restaurant.menu.items, "Dinner")),
        ]),
      ),
    ]);
  }

  Widget _tabbarView() {
    return AnimatedBuilder(
        animation: _tabController.animation!,
        child: RestaurantMenuList(
            menu: getMenuByCategory(restaurant.menu.items, "Breakfast")),
        builder: (context, child) {
          return _getSlideTransition(child);

          // return FadeTransition(opacity: _animationController, child: child);
        });
  }

  SlideTransition _getSlideTransition(Widget? child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(_tabController.animation!),
      child: child,
    );
  }
}
