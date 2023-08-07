import 'package:flutter/material.dart';
import 'package:naatomeals/screens/home/widgets/heading.dart';

import '../../../data/models/restaurant.dart';
import '../../../utils/styles.dart';

class Offers extends StatelessWidget {
  final List<Restaurant> restaurants;
  const Offers({super.key, required this.restaurants});

  Widget _build_restaurant_cards() {
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

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      const HeadingOptions(heading: " Offers for you", subHeading: "See all"),
      _build_restaurant_cards(),
    ]));
  }
}

class RestaurantCard extends StatelessWidget {
  final double width = 175;
  final double height = 110;
  final String? offerMessage;
  final Restaurant restaurant;
  const RestaurantCard(
      {required this.restaurant, super.key, this.offerMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(children: [
                Positioned(
                    left: 0,
                    top: 10,
                    child: Visibility(
                      visible: offerMessage != null,
                      child: Container(
                          width: 70,
                          height: 24,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: yellowColor20),
                          child: Center(
                            child: Text(offerMessage ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600)),
                          )),
                    )),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Icon(Icons.my_location_rounded, color: orangeColor, size: 16),
              const SizedBox(width: 5),
              Text("3.5 Km away",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
