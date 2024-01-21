import 'package:flutter/material.dart';
import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/models/cart_model.dart';
import 'package:flutter_first_app/models/catalog_model.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveItem]);
    final CartModel cart = (VxState.store as AppStore).cart;

    bool isInCart = cart.items.contains(catalog);
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);

          // setState(() {});
        }
      },
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(Icons.add_shopping_cart_outlined),
    );
  }
}
