import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_app/models/catalog_model.dart';
import 'package:flutter_first_app/pages/products.dart';
import '../widgets/items.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final url = "anyurl";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    // Using local data
    var catalogData = await rootBundle.loadString("assets/files/catalog.json");

    // Using online API/JSON
    // final response = await http.get(Uri.parse(url));
    // final catalogData = response.body;

    final decodedData = jsonDecode(catalogData);
    var productsData = decodedData["products"];

    CatalogModel.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    if (mounted) {
      setState(() {});
    }
    // dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.canvasColor,
      child:
          (CatalogModel.products != null && CatalogModel.products!.isNotEmpty)
              ? const CatalogProductsList().p12()
              : const ProgressAnimation(),
    );
  }
}

class CatalogProductsList extends StatelessWidget {
  const CatalogProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: CatalogModel.products!.length,
      itemBuilder: (context, index) {
        final item = CatalogModel.products![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Products(item: item),
            ),
          ),
          child: ItemWidget(
            item: item,
          ),
        );
      },
    );
  }
}

class CatalogProductsGrid extends StatelessWidget {
  const CatalogProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: CatalogModel.products!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final item = CatalogModel.products![index];
        return ItemWidget(item: item);
      },
    );
  }
}

class ProgressAnimation extends StatelessWidget {
  const ProgressAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
