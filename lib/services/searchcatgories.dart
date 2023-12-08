import 'package:storeapp/helper/api.dart';
import 'package:storeapp/models/productmodel.dart';

class SearchCatgoriesServices {
  Future<List<ProductModel>> searchcatgoriees(
      {required String Catgories}) async {
    List<dynamic> data = await Api()
        .get(url: "https://fakestoreapi.com/products/category/$Catgories");
    List<ProductModel> product = [];
    for (int i = 0; i < data.length; i++) {
      product.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return product;
  }
}
