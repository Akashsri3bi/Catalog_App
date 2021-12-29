class CatalogModel {
  /*This three lines to make any flutter class singleton
  static final catModel = CatalogModel._internal();

  //Constructor
  CatalogModel._internal();

  factory CatalogModel() => catModel;
  */

  static List<Item>? items;

  //get item by id
  Item getbyId(int id) =>
      items!.firstWhere((element) => element.id == id, orElse: null);
  //get Item by Position
  Item getbyPos(int pos) => items![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

final products = [
  Item(
      id: 1,
      name: 'Iphone 12 pro',
      desc: 'Apple Iphone 12 generation',
      price: 900,
      color: '#33565a',
      image: "https://picsum.photos/seed/picsum/200/300"),
];
