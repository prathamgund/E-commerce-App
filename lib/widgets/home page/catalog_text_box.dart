// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogTextBox extends StatelessWidget {
  const CatalogTextBox({
    Key? key,
    required this.name,
    required this.desc,
  }) : super(key: key);

  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        name.text.color(context.accentColor).bold.xl.make(),
        desc.text.color(context.accentColor).lg.make(),
      ],
    );
  }
}
