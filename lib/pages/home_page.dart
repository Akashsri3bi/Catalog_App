import 'dart:convert';

import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';

import 'package:catalog/widgets/home_widgets/catalog_header.dart';
import 'package:catalog/widgets/home_widgets/catalog_list.dart';

import 'package:catalog/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //We need to load data and we need to do some changes and mutation so we use Stateful Widget.
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "AkashSri";

  final url =
      "https://gist.github.com/Akashsri3bi/014f1bf716ea44afc5d992c2ea1a2aa9#file-catalog-json";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    //This is in Service Library of flutter .

    //this line of code when local json file   =>
    /*
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    This line when we need to do http url parsing .
    */
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    //we need to decode this json data using dart convert library
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    //We are generting a list from products Data and mapping our created method for mapping the items
    //From the Item Class we created. see the Item class for reference.
    CatalogModel.items = List.from(productsData)
        .map((item) => Item.fromMap(item))
        .cast<Item>()
        .toList();
    //We need to setState to call build method for every change to reflect as it is Stateful Widget
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, status, index) => FloatingActionButton(
          onPressed: () {
            context.vxNav.push(Uri.parse(MyRoutes.cartRoute));
            //Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: MyTheme.darkBluishColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red600,
            size: 22,
            count: _cart!.items.length,
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),

      //We removed all the code and that you can find the gridview and all stuffs in prev home_page.dart notes
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: Vx.m16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16()
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
