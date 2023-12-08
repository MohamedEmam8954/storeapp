import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/productmodel.dart';
import 'package:storeapp/services/getallproduct.dart';
import 'package:storeapp/widgets/customcard.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = "homeview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New trend"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.cartPlus,
            ),
          )
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: GetAllProductServices().getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                itemCount: product.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //نسبه العرض بالنسبه للطول
                  childAspectRatio: 1.4,
                  //المسافات علي محور X
                  crossAxisSpacing: 15,
                  //المسافات علي محور y
                  mainAxisSpacing: 120,
                ),
                itemBuilder: (context, index) {
                  return customcard(
                    productModel: product[index],
                  );
                },
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
