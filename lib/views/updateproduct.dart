import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/services/postproduct.dart';
import 'package:storeapp/widgets/custombuttom.dart';
import 'package:storeapp/widgets/customtextform.dart';

class Updateproduct extends StatelessWidget {
  Updateproduct({super.key});
  static String id = "updateproduct";
  String? price;
  String? descripition, image, productname;
  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Update product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Customtextformfield(
                onchanged: (value) {
                  productname = value;
                },
                hinttext: "productname",
              ),
              SizedBox(
                height: 15,
              ),
              Customtextformfield(
                hinttext: "price",
                onchanged: (value) {
                  price = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Customtextformfield(
                hinttext: "description",
                textInputType: TextInputType.number,
                onchanged: (value) {
                  descripition = value;
                },
              ),
              SizedBox(
                height: 15,
              ),
              Customtextformfield(
                onchanged: (value) {
                  image = value;
                },
                hinttext: "image",
              ),
              SizedBox(
                height: 30,
              ),
              Custombuttom(
                ontap: () async {
                  updateproduct(productModel);
                  try {} catch (e) {
                    log(e.toString());
                  }
                },
                text: "Updateproduct",
                color: Colors.blue,
                size: 450,
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateproduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
        id: productModel.id,
        title:
            productname == null ? productModel.title.toString() : productname!,
        price: price == null ? productModel.price.toString() : price!,
        dercription:
            descripition == null ? productModel.description : descripition!,
        category: productModel.category,
        image: image == null ? productModel.image : image!);
  }
}
