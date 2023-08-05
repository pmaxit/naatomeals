import 'package:flutter/material.dart';

import '../../../data/models/menu.dart';
import 'menu.dart';

class RestaurantMenuList extends StatelessWidget {
  const RestaurantMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemExtent: 150,
        itemCount: 5,
        itemBuilder: (context, index) => const RestaurantCard());
  }
}
