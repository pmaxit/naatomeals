import 'menu.dart';

class RestaurantDetailResponse {
  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurantDetail,
  });

  final bool error;
  final String message;
  final RestaurantDetail restaurantDetail;

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResponse(
        error: json['error'],
        message: json['message'],
        restaurantDetail: RestaurantDetail.fromJson(json['restaurant']),
      );
}

class RestaurantDetail {
  RestaurantDetail({
    required this.id,
    required this.name,
    this.description,
    required this.city,
    this.address,
    required this.pictureId,
    required this.rating,
    this.categories,
    this.menus,
    this.customerReviews,
  });

  final String id;
  final String name;
  final String? description;
  final String city;
  final String? address;
  final String pictureId;
  final double rating;
  final List<Category>? categories;
  final RestaurantMenu? menus;
  final List<CustomerReview>? customerReviews;

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) =>
      RestaurantDetail(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        rating: json['rating'].toDouble(),
        categories: List<Category>.from(
            json['categories'].map((item) => Category.fromJson(item))),
        menus: RestaurantMenu.fromJson(json['menus']),
        customerReviews: List<CustomerReview>.from(json['customerReviews']
            .map((item) => CustomerReview.fromJson(item))),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'city': city,
        'pictureId': pictureId,
        'rating': rating
      };

  factory RestaurantDetail.fromMap(Map<String, dynamic> map) =>
      RestaurantDetail(
        id: map['id'],
        name: map['name'],
        city: map['city'],
        pictureId: map['pictureId'],
        rating: map['rating'].toDouble(),
      );
}
