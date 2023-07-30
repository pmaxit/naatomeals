import 'package:flutter/material.dart';

import '../../../data/models/menu.dart';
import 'menu.dart';

class RestaurantMenuList extends StatelessWidget {
  final MenuCategory menuCategory;
  const RestaurantMenuList({super.key, required this.menuCategory});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemExtent: 150,
        itemCount: 5,
        itemBuilder: (context, index) =>
            const RestaurantCard(menuCategory: MenuCategory.breakfast));
  }
}
