// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_first_app/models/catalog_model.dart';
import 'package:flutter_first_app/widgets/home%20page/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(item.id.toString()),
            child: Image.network(item.imageUrl, fit: BoxFit.fill),
          ).h40(context),
          Expanded(
            child: VxArc(
              height: 22,
              arcType: VxArcType.convey,
              edge: VxEdge.top,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    item.name.text
                        .color(context.accentColor)
                        .bold
                        .xl4
                        .make(),
                    item.desc.text
                        .color(context.accentColor)
                        .lg
                        .make(),
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                        .text
                        .color(context.accentColor)
                        .center
                        .make()
                        .p12(),
                  ],
                ).py64(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH4,
        children: [
          "\$${item.price}".text
              .color(context.accentColor)
              .bold
              .xl3
              .make(),
          AddToCart(
            catalog: item,
          ).wh(80, 40),
        ],
      ).p32(),
    );
  }
}
