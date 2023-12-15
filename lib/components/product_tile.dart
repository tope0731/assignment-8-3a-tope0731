import 'package:assign_8/models/product.dart';
import 'package:assign_8/screen/edit_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProductTile extends StatelessWidget {
  ProductTile(
      {super.key,
      required this.product,
      required this.deleteProduct,
      required this.insertProduct});

  final Product product;
  final NumberFormat priceFormatter = NumberFormat.currency(symbol: "Php ");
  final Function(Product p) deleteProduct;
  final Function(Product p) insertProduct;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(product.sku)),
      title: Text(product.name),
      subtitle: Text(priceFormatter.format(product.price)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (_) => EditProductScreen(
                    product: product, insertProduct: insertProduct),
              ),
            ),
            icon: const Icon(Icons.edit, color: Colors.green),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Center(
                    child: const Text("Delete?"),
                  ),
                  content:
                      Text("Are you sure you want to delete ${product.name}"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          deleteProduct(product);
                          Navigator.pop(context);
                        },
                        child: const Text("Yes")),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("No"))
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete_forever,
                color: Color.fromARGB(255, 232, 19, 4)),
          ),
        ],
      ),
    );
  }
}
