import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productmodel.dart';

class AddProductServices {
  AddProductServices(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.Category,
      required this.image});
  final int id;
  final String title;
  final num price;
  final String description;
  final String Category;
  final String image;

  Future<ProductModel> addProduct() async {
    Map<String, dynamic> data =
        await Api().add(url: "https://fakestoreapi.com/products", body: {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": Category,
    });
    return ProductModel.fromJson(data);
  }
}
