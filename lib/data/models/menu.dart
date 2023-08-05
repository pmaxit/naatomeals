class Cuisines {
  final String name;

  Cuisines({required this.name});
}

class MenuItem {
  final String image;
  final num price;
  final String veg_or_non_veg;
  final String name;

  MenuItem(
      {required this.image,
      required this.price,
      required this.veg_or_non_veg,
      required this.name});

  // from json
  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        image: json['image'],
        price: json['price'],
        veg_or_non_veg: json['veg_or_non_veg'],
        name: json['name'],
      );
}

class Menu {
  final String category;
  final List<MenuItem> items;

  Menu({required this.category, required this.items});

  // from json
  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        category: json['category'],
        items: json['items'],
      );
}
