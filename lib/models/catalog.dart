class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iphone1",
        desc: "apple desc",
        price: 999,
        color: "#33505a",
        image: "https://m.media-amazon.com/images/I/41xssMLI2DL._AC_SY780_.jpg")
  ];
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
}

// final products = [
//   Item(
//       id: 1,
//       name: "iphone1",
//       desc: "apple desc",
//       price: 999,
//       color: "#33505a",
//       image: "https://m.media-amazon.com/images/I/41xssMLI2DL._AC_SY780_.jpg")
// ];
