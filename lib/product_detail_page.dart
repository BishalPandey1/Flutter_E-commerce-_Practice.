import 'package:ecommerce/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 241, 159),
        title: Text("Detail", style: TextStyle(color: Colors.white)),
      ),

      body: ListView(
        children: [
          SizedBox(
            height: 250,
            width: 500,
            child: Image.network(product.image),
          ),
          Padding(padding: EdgeInsetsGeometry.only(bottom: 50)),

          Center(
            child: Text(
              product.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Center(
            child: Text(
              "View more....",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
