import 'package:flutter/material.dart';
import 'package:specxsol/features/products/product.dart';
import 'package:specxsol/features/products/product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> dummyProducts = [
    Product(
      id: '1',
      name: 'Arhlo ARH039 Eyeglasses',
      imageUrl: 'https://specxsol.com/cdn/shop/files/ArhloARH039Eyeglasses_720x.png',
      regularPrice: 59.99,
      isFrameOnly: true,
      brand: 'Arhlo',
      type: 'Eyeglasses',
    ),
    Product(
      id: '2',
      name: 'Ray-Ban Meta RW4008 601ST3 Wayfarer Sunglasses',
      imageUrl: 'https://specxsol.com/cdn/shop/products/RB4008_601ST3_50_720x.jpg',
      regularPrice: 260.00,
      isFrameOnly: true,
      brand: 'Ray-Ban',
      type: 'Sunglasses',
    ),
    Product(
      id: '3',
      name: 'Emporio Armani EA1027',
      imageUrl: 'https://specxsol.com/cdn/shop/products/EA10273001_1_720x.jpg',
      regularPrice: 99.00,
      isFrameOnly: true,
      brand: 'Emporio Armani',
      type: 'Glasses',
    ),
    Product(
      id: '4',
      name: 'Polo PH1001',
      imageUrl: 'https://specxsol.com/cdn/shop/products/PH10019002_1_720x.jpg',
      regularPrice: 99.00,
      isFrameOnly: true,
      brand: 'Polo',
      type: 'Eyeglasses',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(product.name),
              subtitle: Text('£${product.regularPrice.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
