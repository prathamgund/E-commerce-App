import 'package:flutter/material.dart';
import 'package:flutter_first_app/widgets/home%20page/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_first_app/models/catalog_model.dart';

class CatalogButtonBar extends StatelessWidget {
  const CatalogButtonBar({
    super.key,
    required this.item,
    required this.price,
  });

  final Item item;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceBetween,
      buttonPadding: Vx.mH8,
      children: [
        "\$$price".text.bold.color(context.accentColor).lg.make(),
        AddToCart(
          catalog: item,
        ),
      ],
    ).pOnly(right: 12);
  }
}
