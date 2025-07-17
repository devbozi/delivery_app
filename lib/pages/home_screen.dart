import 'package:delivery_app/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, String>> _products = [
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
      'title': 'Cheese burger',
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
  ];

  static const List<Map<String, String>> _categories = [
    {'emoji': '🥩', 'label': 'Meat'},
    {'emoji': '🍔', 'label': 'Fast Food'},
    {'emoji': '🍣', 'label': 'Sushi'},
    {'emoji': '🍹', 'label': 'Drinks'},
    {'emoji': '🍨', 'label': 'Dessert'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello 👋',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const Text(
                          'Diego Campos',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  // ignore: non_constant_identifier_names
                  final Category = _categories[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == _categories.length - 1 ? 0 : 16,
                    ),
                    child: _buildCategoryItem(
                      Category['emoji']!,
                      Category['label']!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            //baner de promocao
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 140),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E3C72).withValues(alpha: 0.5),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),

              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -15,
                    bottom: -15,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'LIMITED OFFER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '30% OFF',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'On your first order',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF1E3C72),
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text(
                                  'Order Now',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 2,
                          child: Transform.translate(
                            offset: Offset(15, 0),
                            child: Image.asset(
                              'assets/chef.webp',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best Sellers',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See All',
                    style: TextStyle(color: Color(0xFF1E3C72)),
                  ),
                ),
              ],
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.66,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ProductCard(
                  title: product['title'] ?? '',
                  price: product['price'] ?? '',
                  calories: product['calories'] ?? '',
                  time: product['time'] ?? '',
                  imagePath: product['imagePath'] ?? '',
                );
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String emoji, String title) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 34)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
