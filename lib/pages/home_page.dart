// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogue/models/carts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/pages/home_detail_page.dart';
import 'package:flutter_catalogue/utils/routes.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';
import 'package:flutter_catalogue/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); //rootBundle has services firstly load that services
    final decodedData = jsonDecode(
        catalogJson); //string/jsonData -> Map or jsonEncode Map -> String/jsonData
    // print(decodedData);
    var productsData = decodedData["products"];
    // print(productsData);
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {}); //for continuous data in the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).canvasColor, //not using velocity
        backgroundColor: context.canvasColor, //using velocity
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
          //this property is use to safe our code of battery other icons
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().py16().expand(),
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.color(context.theme.accentColor).make(),
        "Trending Product".text.xl.make().pOnly(left: 9.0),
      ],
    ).pOnly(bottom: 20);
  }
}

class CatalogList extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        // final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => HomeDetailPage(catalog: catalog),
                    builder: (context) => HomeDetailPage(catalog: catalog),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        // _cart.catalog = _catalog;
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          // backgroundColor:
          //     MaterialStateProperty.all(MyTheme.darkBluishColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isAdded ? Icon(Icons.done) : "Add to cart".text.xl.make(),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            children: [
              catalog.name.text.xl2
                  .color(context.accentColor)
                  .bold
                  .make()
                  .py8(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl2.make(),
                  _AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 9.0)
            ],
          ))
        ],
      ),
    )
        .color(context.cardColor)
        .square(120)
        .rounded
        .make()
        .py16(); //VxBox is similar of Container
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image}) : assert(image != null);

  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p16
        .color(context.canvasColor)
        .make()
        .p8()
        .w24(context);
  }
}
