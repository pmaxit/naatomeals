import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/restaurant.dart';
import '../../../utils/styles.dart';

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
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              restaurants[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
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
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: restaurants[index].cuisines.length,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Text(
                                  restaurants[index].cuisines[i].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
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
                        ]),
                  )
                ]),
              ),
            ),
          );
        }, childCount: restaurants.length));
  }
}
