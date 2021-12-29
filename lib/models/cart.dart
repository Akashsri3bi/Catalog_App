import 'package:catalog/core/store.dart';
import 'package:catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  /*This three lines to make any flutter class singleton
  static final cartModel = CartModel._internal();

  //Constructor
  CartModel._internal();

  factory CartModel() => cartModel;
  */

  //catalog feild
  late CatalogModel _catalog;

  //Collection of Ids  = store Ids of each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getbyId(id)).toList();

  //get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

//Before Mutations we used this methods
/*
  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
  */
}

class AddMutation extends VxMutation<MyStore?> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore?> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.remove(item.id);
  }
}
