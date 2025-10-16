import 'package:flutter/material.dart';
import 'package:quickbite/core/constants/colors.dart';
import 'package:quickbite/core/constants/text_styles.dart';
import 'package:quickbite/widgets/home_widget/product_card.dart'; // Import for suggestions

class FoodDetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String basePrice;
  final String details;
  final String description; // New prop for detailed description

  const FoodDetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.basePrice,
    required this.details,
    this.description = 'A delicious pizza with fresh ingredients and customizable toppings.', // Default description
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> with TickerProviderStateMixin {
  String selectedSize = 'Medium';
  bool addChicken = true;
  bool addMushroom = false;
  int quantity = 1; // New: Quantity selector

  late double basePrice;
  final double chickenPrice = 1.40;
  final double mushroomPrice = 0.40;

  // New: Animations
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    basePrice = double.parse(widget.basePrice.replaceAll('\$', ''));
    
    // Initialize fade animation for details section
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void updateQuantity(bool increase) {
    setState(() {
      if (increase) {
        quantity++;
      } else if (quantity > 1) {
        quantity--;
      }
    });
  }

  double get totalPrice {
    double subtotal = basePrice;
    if (addChicken) subtotal += chickenPrice;
    if (addMushroom) subtotal += mushroomPrice;
    return subtotal * quantity;
  }

  // New: Size price mapping for easier management
  double getSizePrice(String size) {
    switch (size) {
      case 'Small':
        return 8.99;
      case 'Medium':
        return 10.99;
      case 'Large':
        return 12.99;
      default:
        return basePrice;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Enhanced suggestions data with more variety and exclusion logic (dummy check)
    final List<Map<String, dynamic>> suggestions = [
      {
        'image': 'assets/images/burger.jpg',
        'name': 'Cheese Burger',
        'price': '\$4.99',
        'details': '44 Calories | 20 min',
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Veggie Pizza',
        'price': '\$9.99',
        'details': '50 Calories | 25 min',
      },
      {
        'image': 'assets/images/burger.jpg',
        'name': 'Chicken Burger',
        'price': '\$6.99',
        'details': '45 Calories | 25 min',
      },
      {
        'image': 'assets/images/salad.jpg', // New image for variety
        'name': 'Caesar Salad',
        'price': '\$7.99',
        'details': '30 Calories | 15 min',
      },
    ].where((suggestion) => suggestion['name'] != widget.name).toList(); // Exclude current item

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Hero Image Stack
              Stack(
                children: [
                  Hero(
                    tag: widget.image, // Enable hero animation
                    child: Image.asset(
                      widget.image,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 70,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.share,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              // Product Details with Fade Animation
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // New: Full Description
                      Text(
                        widget.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Changed to start for better alignment
                        children: [
                          Text(
                            widget.details.split(' | ')[0], // e.g., "44 Calories"
                            style: TextStyle(
                              color: AppColors.primary.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          Text(
                            " 4.8 (2.2k)",
                            style: TextStyle(
                              color: AppColors.primary.withOpacity(0.7),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Size Options
                      Text(
                        'Size',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: ['Small', 'Medium', 'Large'].map((size) {
                          bool isSelected = selectedSize == size;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                                basePrice = getSizePrice(size); // Use mapping for cleaner code
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.primary : Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                "${size == 'Small' ? '6"' : size == 'Medium' ? '8"' : '10"'} $size",
                                style: TextStyle(
                                  color: isSelected ? Colors.white : AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                      // Add Ingredients
                      Text(
                        "Add Ingredients",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      IngredientTile(
                        name: "Chicken",
                        quantity: "220 gm",
                        price: chickenPrice,
                        isSelected: addChicken,
                        onChanged: (value) => setState(() => addChicken = value ?? false),
                      ),
                      IngredientTile(
                        name: "Mushroom",
                        quantity: "16 gm",
                        price: mushroomPrice,
                        isSelected: addMushroom,
                        onChanged: (value) => setState(() => addMushroom = value ?? false),
                      ),
                      // New: Additional Ingredient
                      IngredientTile(
                        name: "Extra Cheese",
                        quantity: "50 gm",
                        price: 0.80,
                        isSelected: false,
                        onChanged: (value) {
                          // You can add a bool here if needed, but for now, just setState
                          setState(() {}); // Placeholder for new bool
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // New: Quantity Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => updateQuantity(false),
                      icon: const Icon(Icons.remove, color: AppColors.primary),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => updateQuantity(true),
                      icon: const Icon(Icons.add, color: AppColors.primary),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Add to Cart Button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    print('Adding ${quantity} x ${widget.name} to cart for \$${totalPrice.toStringAsFixed(2)}');
                    // TODO: Integrate with cart logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added ${quantity} x ${widget.name} to cart!'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  },
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                  label: Text(
                    "Add to Cart - \$${totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Suggestions Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You Might Also Like',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Horizontal ScrollView for Suggestions
                    SizedBox(
                      height: 200, // Height matching approximate ProductCard height
                      child: ListView.separated(
                        itemCount: suggestions.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 16),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(right: 20), // Extra padding for last item
                        itemBuilder: (context, index) {
                          final suggestion = suggestions[index];
                          return Hero(
                            tag: suggestion['image'], // Enable hero animation for suggestions
                            child: ProductCard(
                              image: suggestion['image'] as String,
                              name: suggestion['name'] as String,
                              price: suggestion['price'] as String,
                              details: suggestion['details'] as String,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FoodDetailScreen(
                                      image: suggestion['image'] as String,
                                      name: suggestion['name'] as String,
                                      basePrice: suggestion['price'] as String,
                                      details: suggestion['details'] as String,
                                      description: 'A tasty alternative to your current selection.', // New description
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Extra space at bottom
            ],
          ),
        ),
      ),
    );
  }
}

class IngredientTile extends StatelessWidget {
  final String name;
  final String quantity;
  final double price;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  const IngredientTile({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            checkColor: Colors.white,
          ),
          Expanded(
            child: Text(
              "$name ($quantity)",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
          ),
          Text(
            "+ \$${price.toStringAsFixed(2)}",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}