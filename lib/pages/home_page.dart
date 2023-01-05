import 'package:flutter/material.dart';
import 'package:flutter_catalogue/models/catalog.dart';
import 'package:flutter_catalogue/widgets/drawer.dart';
import 'package:flutter_catalogue/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Codepur";
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(
        20,
        (index) => CatalogModel.items[
            0]); //it can create generate the list of 50 items in the catalog models items ost position
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: ((context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          }),
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
