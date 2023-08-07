import 'package:flutter/material.dart';

import '../../../data/models/restaurant.dart';
import '../../../utils/styles.dart';
import 'heading.dart';

class RestaurantList extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantList({super.key, required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return _build_restaurant_list(context);
  }

  Widget _build_restaurant_list(BuildContext context) {
    return SliverFixedExtentList(
        itemExtent: 85,
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Material(
              child: InkWell(
                onTap: () {
                  //Navigator.pushNamed(context, 'restaurant_page');
                },
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
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          " Speciality: Punjabi",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
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
              ),
            ),
          );
        }, childCount: restaurants.length));
  }
}
