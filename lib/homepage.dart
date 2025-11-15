import 'package:dio/dio.dart';
import 'package:ecommerce/product_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/product_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];

  void fetchProduct() async {
    try {
      final response = await Dio().get("https://fakestoreapi.com/products");
      setState(() {
        products = List.from(
          response.data,
        ).map((e) => Product.fromMap(e)).toList();
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sukuna Ecommerce")),

      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 400,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Center(
                                child: Image.network(product.image),
                              ),
                            ),
                            Text(
                              product.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(product.category),

                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange),
                                Text(product.rating.rate.toString()),
                                Spacer(),
                                Text("${product.rating.count} review"),
                              ],
                            ),

                            Text("\$ ${product.price}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
