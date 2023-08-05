import 'dart:ui';

import 'menu.dart';

class Restaurant {
  final String name;
  final String url;
  final String imageUrl;
  final String address;
  final Image image;
  final Menu menu;

  Restaurant({
    required this.name,
    required this.url,
    required this.imageUrl,
    required this.address,
    required this.image,
    required this.menu,
  });

  // from Map
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        name: json['name'],
        url: json['url'],
        imageUrl: json['imageUrl'],
        address: json['address'],
        image: json['image'],
        menu: Menu.fromJson(json['menu']),
      );
}
