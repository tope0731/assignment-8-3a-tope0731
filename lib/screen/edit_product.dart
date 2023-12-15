import 'package:assign_8/components/textfield.dart';
import 'package:assign_8/models/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditProductScreen extends StatelessWidget {
  EditProductScreen(
      {super.key, required this.product, required this.insertProduct});

  final Product product;
  final Function(Product p) insertProduct;

  final skuController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final dPriceController = TextEditingController();
  final quantityController = TextEditingController();
  final manufacturerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    skuController.text = product.sku;
    nameController.text = product.name;
    descriptionController.text = product.description;
    priceController.text = product.price.toString();
    dPriceController.text = product.dPrice.toString();
    quantityController.text = product.quantity.toString();
    manufacturerController.text = product.manufacturer;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Product Details",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                  controller: skuController, label: "SKU", isReadOnly: true),
              const Gap(10),
              CustomTextField(
                  controller: nameController, label: "Name", isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: descriptionController,
                  label: "Description",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: priceController,
                  label: "Price",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: dPriceController,
                  label: "Discounted Price",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: quantityController,
                  label: "Quantity",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: manufacturerController,
                  label: "Manufacturer",
                  isReadOnly: false),
              const Gap(10),
              Container(
                width: double.infinity,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 72, 134, 78),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Save changes?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  insertProduct(Product(
                                      sku: skuController.text,
                                      name: nameController.text,
                                      description: descriptionController.text,
                                      price: double.parse(priceController.text),
                                      dPrice:
                                          double.parse(dPriceController.text),
                                      quantity:
                                          int.parse(quantityController.text),
                                      manufacturer:
                                          manufacturerController.text));
                                  Navigator.pop(context);
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
                    child: Text(
                      "Save Edits",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
