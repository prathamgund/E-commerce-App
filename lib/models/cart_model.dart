import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  // collection of product IDs
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getByID(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void addItem(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
  void removeItem(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<AppStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveItem extends VxMutation<AppStore> {
  final Item item;

  RemoveItem(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
