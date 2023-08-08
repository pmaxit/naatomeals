import 'package:flutter/material.dart';

import '../../../data/models/menu.dart';
import 'menu.dart';

class RestaurantMenuList extends StatelessWidget {
  List<MenuItem> menu = [];
  RestaurantMenuList({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    print("menu length ${menu.length}");
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemExtent: 150,
        itemCount: menu.length,
        itemBuilder: (context, index) =>
            RestaurantCard(menu: menu[index], image: menu[index].image));
  }
}
