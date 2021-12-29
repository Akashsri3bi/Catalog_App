import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: context.theme.canvasColor,
          ),
          backgroundColor: context.theme.canvasColor,
          bottomNavigationBar: Container(
            color: context.cardColor,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl4.red800.make(),
                AddtoCart(catalog: catalog).wh(120, 50)
              ],
            ).p32(),
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image),
                ).h32(context).backgroundColor(context.theme.canvasColor),
                Expanded(
                    child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEX,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.theme.backgroundColor)
                            .bold
                            .make(),
                        catalog.desc.text
                            .textStyle(context.captionStyle!)
                            .xl
                            .color(context.primaryColor)
                            .make(),
                        10.heightBox,
                        "Display widgets handle what the user sees onscreen. Examples of display widgets "
                            .text
                            .textStyle(context.captionStyle!)
                            .color(context.primaryColor)
                            .make()
                            .p16(),
                      ],
                    ).py32(),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
