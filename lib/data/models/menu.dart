enum MenuCategory {
  breakfast,
  lunch,
  dinner,
  dessert,
  drinks,
  cofee,
  rice,
  daal
}

class Category {
  Category({
    required this.name,
  });

  final String name;

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(name: json['name']);
}

class RestaurantMenu {
  RestaurantMenu({
    required this.name,
    required this.foods,
    required this.drinks,
  });

  final MenuCategory name;
  final List<MenusItem> foods;
  final List<MenusItem> drinks;

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) => RestaurantMenu(
        foods: List<MenusItem>.from(
            json['foods'].map((item) => MenusItem.fromJson(item))),
        drinks: List<MenusItem>.from(
            json['drinks'].map((item) => MenusItem.fromJson(item))),
        name: json['name'],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        'foods': List<dynamic>.from(foods.map((item) => item.toJson())),
        'drinks': List<dynamic>.from(drinks.map((item) => item.toJson())),
      };
}

class MenusItem {
  MenusItem({required this.name});

  final String name;

  factory MenusItem.fromJson(Map<String, dynamic> json) =>
      MenusItem(name: json['name']);

  // toJson
  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  final String name;
  final String review;
  final String date;

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
        name: json['name'],
        review: json['review'],
        date: json['date'],
      );

  // toJson
  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'date': date,
      };
}
