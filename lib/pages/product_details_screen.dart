
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectSize = 'Medium';
  int quantity = 1;
  bool chickenSelected = false;
  bool mushroomSelected = false;
  bool cheeseSelected = false;

  String productTitle = 'Melting Cheese Pizza';
  String productPrice = '10.99';
  String productImagePath = 'assets/pizza.png';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      productTitle = args['title'] ?? productTitle;
      productPrice = args['price'] ?? productPrice;
      productImagePath = args['imagePath'] ?? productImagePath;
    }

    String numericPrice = productPrice.replaceAll(RegExp(r'[^\d.]'), '');
    double basePrice = double.tryParse(numericPrice) ?? 10.99;
    double totalPrice = basePrice * quantity;

    if (chickenSelected) totalPrice += 1.40;
    if (mushroomSelected) totalPrice += 0.40;
    if (cheeseSelected) totalPrice += 1.20;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Center(
                      child: Image.asset(
                        productImagePath,
                        height: 240,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Pizza Italiana',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 18),
                                SizedBox(width: 4),
                                Text(
                                  '4.8',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '(2.2k)',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        Text(
                          productTitle,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                          'Size',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            _buildSizeOption('8"', r'$8.99', 'Small'),
                            const SizedBox(width: 12),
                            _buildSizeOption('12"', r'$10.99', 'Medium'),
                            const SizedBox(width: 12),
                            _buildSizeOption('16"', r'$12.99', 'Large'),
                          ],
                        ),
                        const SizedBox(height: 32),

                        Text(
                          'Add Ingredients',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildIngredientItem(
                          'Chicken',
                          '250gm',
                          r'+$1.40',
                          chickenSelected,
                          (value) => setState(() => chickenSelected = value),
                        ),
                        const SizedBox(height: 12),
                        _buildIngredientItem(
                          'Mushroom',
                          '50gm',
                          r'+$0.40',
                          mushroomSelected,
                          (value) => setState(() => mushroomSelected = value),
                        ),
                        const SizedBox(height: 12),
                        _buildIngredientItem(
                          'Cheese',
                          '30gm',
                          r'+$2.40',
                          cheeseSelected,
                          (value) => setState(() => cheeseSelected = value),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ]
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) setState(() => quantity --);
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 18),
                      ),
                      Text(
                        '$quantity',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() => quantity ++),
                        icon: Icon(
                          Icons.add,
                          size: 18),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(width: 16),

                Expanded(child:
                 ElevatedButton(onPressed: () {},
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E3C72),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                 ),
                 child: Text(
                  'Add to Cart - \$${totalPrice.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                 )),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(
    String name,
    String weight,
    String price,
    bool isSelected,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset('assets/burger.png', width: 24, height: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.w600)),
                Text(
                  weight,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3C72),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => onChanged(!isSelected),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF1E3C72) : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? Color(0xFF1E3C72) : Colors.grey.shade300,
                ),
              ),
              width: 22,
              height: 22,
              child: isSelected ? Icon(Icons.check, color: Colors.white) : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSizeOption(String size, String price, String value) {
    bool isSelected = selectSize == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectSize = value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1E3C72) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Color(0xFF1E3C72) : Colors.grey.shade200,
            ),
          ),
          child: Column(
            children: [
              Text(
                size,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: TextStyle(
                  fontSize: 13,
                  color: isSelected ? Colors.white : Color(0xFF1E3C72),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
