import 'package:delivery_app/widgets/product_card.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  static const List<Map<String, String>> _wishlistProducts = [
    {
      'title': 'Melting Cheese Pizza',
      'price': r'$10.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/pizza.jpg',
    },
    {
      'title': 'Cheese burger',
      'price': r'$4.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/burger.jpg',
    },
    {
      'title': 'Double Cheese burger',
      'price': r'$14.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/doubleburger.jpg',
    },
    {
      'title': 'Sushi',
      'price': r'$14.99',
      'calories': '44 Calories',
      'time': '20 min',
      'imagePath': 'assets/sushi.jpg',
    },
  ];

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f6f6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Wishlist',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:
            _wishlistProducts.isEmpty
                ? Center(
                  child: Text(
                    'No items in your wishlist',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                : GridView.builder(
                  itemCount: _wishlistProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.66,
                  ),
                  itemBuilder: (context, index) {
                    final product = _wishlistProducts[index];
                    return ProductCard(
                      title: product['title'] ?? '',
                      price: product['price'] ?? '',
                      calories: product['calories'] ?? '',
                      time: product['time'] ?? '',
                      imagePath: product['imagePath'] ?? '',
                    );
                  },
                ),
      ),
    );
  }
}
