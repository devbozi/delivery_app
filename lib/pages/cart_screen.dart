import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                _buildCartItem(
                  'Melting Cheese Pizza',
                  'Pizza Italiana',
                  r'$11.88',
                  1,
                  'assets/pizza.jpg',
                ),
                const SizedBox(height: 16),
                _buildCartItem(
                  'Chicken Salad',
                  'Mad Hourse',
                  r'$9.88',
                  1,
                  'assets/sushi.jpg',
                ),
                const SizedBox(height: 16),
                _buildCartItem(
                  'Cheese Burger',
                  'Burger Hunt',
                  r'$4.88',
                  1,
                  'assets/burger.jpg',
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(
    String title,
    String subtitle,
    String price,
    int quantity,
    String imagePath,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              imagePath,
               fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
