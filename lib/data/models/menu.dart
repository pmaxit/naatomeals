class Cuisines {
  final String name;

  Cuisines({required this.name});

  // From Json
  factory Cuisines.fromJson(Map<String, dynamic> json) {
    return Cuisines(
      name: json['name'],
    );
  }

  //toString
  @override
  String toString() {
    return 'Cuisines{name: $name}';
  }
}

class MenuItem {
  final String category;
  final String? subCategory;
  final String? image;
  final List<Map<String, dynamic>> items;

  MenuItem(
      {required this.category,
      required this.items,
      required this.subCategory,
      required this.image});

  // create dummy item
  static MenuItem dummyItem() {
    return MenuItem(
      category: '',
      items: [],
      subCategory: '',
      image: '',
    );
  }

  // toString
  @override
  String toString() {
    return 'MenuItem{category: $category, items: $items}';
  }

  // from json
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> items = [];
    for (var element in json['items']) {
      items.add(element as Map<String, dynamic>);
    }
    return MenuItem(
      category: json['category'],
      items: items,
      subCategory: json['subCategory'],
      image: json['image'] ?? 'https://picsum.photos/200/300',
    );
  }
}

class Menu {
  final List<MenuItem> items;

  Menu({required this.items});

  // from json
  factory Menu.fromJson(List<dynamic> json) {
    List<MenuItem> items = [];
    for (var element in json) {
      items.add(MenuItem.fromJson(element as Map<String, dynamic>));
    }
    return Menu(
      items: items,
    );
  }

  // to String
  @override
  String toString() {
    return 'Menu{items: $items}';
  }
}
