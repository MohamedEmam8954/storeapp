import 'package:flutter/material.dart';

import 'package:storeapp/views/homeview.dart';
import 'package:storeapp/views/updateproduct.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => HomeView(),
        Updateproduct.id: (context) => Updateproduct()
      },
      initialRoute: HomeView.id,
    );
  }
}
