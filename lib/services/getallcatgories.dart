import 'dart:developer';
import 'package:storeapp/helper/api.dart';

class GetAllCatgoriesservices {
  Future<List<dynamic>> getAllCatgories() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products/categories");

    log(data.toString());
    return data;
  }
}
