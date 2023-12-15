import 'package:assign_8/components/product_tile.dart';
import 'package:assign_8/dbhelper/dbhelper.dart';
import 'package:assign_8/models/product.dart';
import 'package:assign_8/screen/add_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProductHomeScreen> {
  void insertProduct(Product p) {
    DbHelper.insertProduct(p);
    setState(() {});
  }

  void deleteProduct(Product p) {
    DbHelper.deleteProduct(p);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Management",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                  builder: (_) =>
                      AddProductScreen(insertProduct: insertProduct))),
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: DbHelper.fetch(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            var products = snapshot.data;
            if (products == null)
              return const Center(child: Text("No product entries"));
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  Product product = Product(
                      sku: products[index][DbHelper.colSku],
                      name: products[index][DbHelper.colName],
                      description: products[index][DbHelper.colDescription],
                      price: double.parse(
                          products[index][DbHelper.colPrice].toString()),
                      dPrice: double.parse(products[index]
                              [DbHelper.colDiscountedPrice]
                          .toString()),
                      quantity: int.parse(
                          products[index][DbHelper.colQuantity].toString()),
                      manufacturer: products[index][DbHelper.colManufacturer]);
                  return ProductTile(
                      product: product,
                      deleteProduct: deleteProduct,
                      insertProduct: insertProduct);
                });
          }),
    );
  }
}
