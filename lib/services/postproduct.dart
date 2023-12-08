import 'dart:developer';

import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productmodel.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String dercription,
    required String image,
    required String category,
    required dynamic id,
  }) async {
    log(id.toString());
    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
      body: {
        "title": title,
        "price": price,
        "description": dercription,
        "image": image,
        "category": category
      },
    );
    return ProductModel.fromJson(data);
  }
}
