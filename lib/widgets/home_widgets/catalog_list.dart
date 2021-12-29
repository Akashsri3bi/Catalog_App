import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
            onTap:
                () => /* This part when we use MaterialApp Naviagtor Navigator.push(
                context,
                //When we need to give some arguments and then call the full Route we use Material Page Route using push
                //Instead of simple pushNamed.
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
                    */
                    context.vxNav.push(Uri.parse(MyRoutes.homeDetailsRoute),
                        params: catalog),
            child: CatalogItem(catalog: catalog));
      },
      itemCount: CatalogModel.items!.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          //Hero is an Animation widget which takes a tag which includes a key and that widget needs to be used on the other item too
          //With same key to get a beautiful transition when going from one Page to another using Routes.
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.primaryColor).bold.make(),
              catalog.desc.text
                  .textStyle(context.captionStyle!)
                  .color(context.primaryColor)
                  .make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}"
                      .text
                      .bold
                      .xl
                      .color(context.primaryColor)
                      .make(),
                  AddtoCart(catalog: catalog)
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
