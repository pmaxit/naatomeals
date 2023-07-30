import 'package:naatomeals/data/models/restaurant.dart';

import 'menu.dart';

class RestaurantListResponse {
  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
    required this.statusCode,
  });

  final bool error;
  final String? message;
  final int? count;
  final List<Restaurant> restaurants;
  final int? statusCode;

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantListResponse(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        statusCode: json['statusCode'],
        restaurants: List<Restaurant>.from(json['restaurants']
            .map((restaurant) => Restaurant.fromJson(restaurant))),
      );

  factory RestaurantListResponse.fromError(String error) =>
      RestaurantListResponse(
          error: true,
          message: error,
          count: 0,
          statusCode: 0,
          restaurants: []);

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants":
            List<Restaurant>.from(restaurants.map((x) => x.toJson())),
      };
}

Restaurant dummyRestaurant = Restaurant(
  id: 'rqdv5juczeskfw1e867',
  name: 'Melting Pot',
  address: 'Jln. Pandeglang no 19',
  description:
      'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...',
  pictureId: '14',
  city: 'Medan',
  rating: 4.2,
  menus: RestaurantMenu(
    name: MenuCategory.lunch,
    foods: [
      MenusItem(
        name: 'Paket rosemary',
      ),
      MenusItem(
        name: 'Toastie salmon',
      ),
      MenusItem(
        name: 'Bebek crepes',
      ),
      MenusItem(
        name: 'Salad lengkeng',
      ),
    ],
    drinks: [
      MenusItem(
        name: 'Jus tomat',
      ),
      MenusItem(
        name: 'Minuman soda',
      ),
      MenusItem(
        name: 'Jus apel',
      ),
      MenusItem(
        name: 'Jus mangga',
      ),
    ],
  ),
);

RestaurantListResponse dummyRestaurantListResponse = RestaurantListResponse(
    error: false,
    message: null,
    count: 20,
    statusCode: 200,
    restaurants: List.generate(5, (index) => dummyRestaurant));
