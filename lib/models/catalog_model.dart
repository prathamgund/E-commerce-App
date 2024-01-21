// ignore_for_file: file_names, null_closures

class CatalogModel {
  // static final catalogModel = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel() => catalogModel;

  static List<Item>? products;

  Item getByID(int id) =>
      products!.firstWhere((element) => element.id == id, orElse: null);

  Item getByPos(int pos) => products![pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String imageUrl;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.imageUrl});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      imageUrl: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": desc,
        "desc": desc,
        "price": price,
        "color": color,
        "image": imageUrl,
      };
}
