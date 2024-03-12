import 'package:first_project/src/data/entity/product_model.dart';
import 'package:first_project/src/features/details_page/details_page_controller.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  late Welcome? product;
  String? id;

  DetailsPage({super.key, this.product, this.id}){
    if(id != null) isNew = false;
    _nameController.text = product?.title ?? "";
    _brandController.text = product?.brand ?? "";
    _priceController.text = product?.price.toString() ?? "";
    _descriptionController.text = product?.description ?? "";
  }

  bool isNew = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding:const  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Enter description',
              ),
              maxLines: null, // Allow multiline input
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                hintText: 'Enter price',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _brandController,
              decoration: const InputDecoration(
                hintText: 'Enter brand',
              ),
            ),
            const SizedBox(height: 16.0),
            MaterialButton(
              onPressed: () {
                Welcome producta = Welcome(
                    id: "producta.id",
                    title: _nameController.text,
                    description: _descriptionController.text,
                    price: _priceController.text,
                    discountPercentage: 1,
                    rating: 1,
                    stock: 1,
                    brand: _brandController.text,
                    category: "category",
                    thumbnail: "thumbnail",
                    images: ["images"],
                );
              if(isNew) {
                DetailsPageController.storeProduct(product:producta);
              } else {
                print("id - $id");
                DetailsPageController.updateProduct(id: id!, product: producta);
              }
              Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
