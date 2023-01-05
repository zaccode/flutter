import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(
    //     20,
    //     (index) => CatalogModel.items[
    //         0]); //it can create generate the list of 50 items in the catalog models items ost position
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: ((context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
            );
          }),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
