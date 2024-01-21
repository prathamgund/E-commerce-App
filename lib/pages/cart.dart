import 'package:flutter/material.dart';
import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CartList().p32().expand(),
        const Divider(),
        const _CartTotal(),
      ],
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as AppStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: const {},
            builder: (context, store, status) {
              return "\$${cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.accentColor)
                  .make();
            },
            mutations: const {RemoveItem},
          ),
          // "\$${_cart.totalPrice}".text.xl4.color(context.accentColor).make(),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const StadiumBorder(),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Purchasing is not supported yet!".text.make(),
                ),
              );
            },
            child: "Buy".text.xl2.make(),
          ).w32(context).h8(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveItem]);
    final CartModel cart = (VxState.store as AppStore).cart;

    return cart.items.isEmpty
        ? "Your cart is empty".text.color(context.accentColor).xl3.make()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              iconColor: context.accentColor,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  RemoveItem(cart.items[index]);
                  // setState(() {});
                },
              ),
              title: cart.items[index].name.text
                  .color(context.accentColor)
                  .make(),
            ),
          );
  }
}
