import 'dart:developer';

import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productmodel.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getProduct() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");
    List<ProductModel> product = [];
    for (int i = 0; i < data.length; i++) {
      product.add(ProductModel.fromJson(data[i]));
    }
    log(data.toString());
    return product;
  }
}
