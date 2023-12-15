import 'package:assign_8/components/textfield.dart';
import 'package:assign_8/models/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key, required this.insertProduct});

  final Function(Product p) insertProduct;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final SkuController = TextEditingController();
    final NameController = TextEditingController();
    final DescriptionController = TextEditingController();
    final PriceController = TextEditingController();
    final DiscountedPriceController = TextEditingController();
    final QuantityController = TextEditingController();
    final ManufacturerController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Enter Product Details",
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              CustomTextField(
                  controller: SkuController, label: "SKU", isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: NameController, label: "Name", isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: DescriptionController,
                  label: "Description",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                controller: PriceController,
                label: "Price",
                isReadOnly: false,
              ),
              const Gap(10),
              CustomTextField(
                  controller: DiscountedPriceController,
                  label: "Discounted Price",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: QuantityController,
                  label: "Quantity",
                  isReadOnly: false),
              const Gap(10),
              CustomTextField(
                  controller: ManufacturerController,
                  label: "Manufacturer",
                  isReadOnly: false),
              const Gap(10),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 72, 134, 78),
                  ),
                  onPressed: () {
                    insertProduct(Product(
                        sku: SkuController.text,
                        name: NameController.text,
                        description: DescriptionController.text,
                        price: double.parse(PriceController.text),
                        dPrice: double.parse(DiscountedPriceController.text),
                        quantity: int.parse(QuantityController.text),
                        manufacturer: ManufacturerController.text));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add Product",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
