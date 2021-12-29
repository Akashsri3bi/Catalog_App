import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../themes.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  const AddtoCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel? _cart = (VxState.store as MyStore).cart;
    bool isAdded = _cart!.items.contains(catalog);
    return ElevatedButton(
        onPressed: () {
          if (!isAdded) {
            AddMutation(catalog);
            //setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              MyTheme.lightBluishColor,
            ),
            shape: MaterialStateProperty.all(
              const StadiumBorder(),
            )),
        child: isAdded
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
