import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(Theme.of(context).primaryColor)
            .make(),
        "Trending products"
            .text
            .xl2
            .color(Theme.of(context).backgroundColor)
            .make(),
      ],
    );
  }
}
