import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naatomeals/screens/home/widgets/app_bar.dart';
import 'package:naatomeals/utils/styles.dart';

import '../../data/models/restaurant.dart';
import '../../services/restaurant_service.dart';
import '../profile/profile_screen.dart';
import 'bloc/home_cubit.dart';
import 'pages/home_page.dart';
import 'widgets/cuisines.dart';
import 'widgets/offers.dart';
import 'widgets/restaurant_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(ref.read(apiProvider))..getRestaurants(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.isLoading == false &&
                state.restaurants.isNotEmpty) {
              switch (currentIndex) {
                case 0:
                  return HomePage(restaurants: state.restaurants.toList());
                case 1:
                  return HomePage(restaurants: state.restaurants.toList());
                case 2:
                  return HomePage(restaurants: state.restaurants.toList());
                case 3:
                  return const ProfileScreen();
                default:
                  return HomePage(restaurants: state.restaurants.toList());
              }
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
}
