import 'dart:ui';

import 'menu.dart';

class Restaurant {
  final String name;
  final String url;
  final String imageUrl;
  final String address;
  final String image;
  final String description;
  final Menu menu;
  final List<Cuisines> cuisines;

  Restaurant({
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.address,
    required this.image,
    required this.menu,
    required this.cuisines,
    this.description = '',
  });

  // from Map
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        name: json['name'],
        url: json['url'],
        imageUrl: json['imageUrl'],
        address: json['address'],
        image: json['imageUrl'],
        description: json['description'],
        menu: Menu.fromJson(json['menu']),
        cuisines: List<Cuisines>.from(
            json['cuisines'].map((x) => Cuisines.fromJson(x))),
      );

  // to String
  @override
  String toString() {
    return 'Restaurant{name: $name, url: $url, imageUrl: $imageUrl, address: $address, image: $image, menu: $menu}';
  }
}
