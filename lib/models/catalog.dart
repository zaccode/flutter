class CatalogModel {
  // static List<Item> items = [
  //   Item(
  //       id: 1,
  //       name: "iphone1",
  //       desc: "apple desc",
  //       price: 999,
  //       color: "#33505a",
  //       image: "https://m.media-amazon.com/images/I/41xssMLI2DL._AC_SY780_.jpg")
  // ];

//This code is single turn code this is initial one time only
  static final cartModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => cartModel;
  //---

  static List<Item> items = [];

  //Get Item by ID
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id = 0,
      this.name = "",
      this.desc = "",
      this.price = 0.0,
      this.color = "",
      this.image = ""});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      //convert the String to Map/object for JsonDecoding
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        //used to for convert the object to string for jsonEncoding
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
