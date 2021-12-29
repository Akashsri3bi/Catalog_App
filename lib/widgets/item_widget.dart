import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:catalog/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Flexible(
        flex: 1,
        child: ListTile(
          onTap: () {},
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: AutoSizeText(
            item.desc,
            maxLines: 2,
          ),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.5,
            style: const TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
