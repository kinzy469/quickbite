import 'package:flutter/material.dart';
import 'package:quickbite/core/constants/colors.dart';
import 'package:quickbite/presentation/screens/home/Home/details_screen.dart';
import 'package:quickbite/widgets/home_widget/product_card.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  String selectedCategory = 'All';

  // Category data with icons
  final List<Map<String, dynamic>> categories = [
    {'name': 'All', 'icon': Icons.restaurant_menu},
    {'name': 'Pizza', 'icon': Icons.local_pizza},
    {'name': 'Burger', 'icon': Icons.lunch_dining},
    {'name': 'Salad', 'icon': Icons.eco},
    {'name': 'Drinks', 'icon': Icons.local_drink},
    {'name': 'Dessert', 'icon': Icons.cake},
  ];

  // All products data
  final List<Map<String, dynamic>> allProducts = [
    {
      'image': 'assets/images/pizza.jpg',
      'name': 'Pepperoni Pizza',
      'price': '\$10.99',
      'details': '50 Calories | 25 min',
      'category': 'Pizza',
      'description': 'Classic pepperoni pizza with mozzarella cheese.',
    },
    {
      'image': 'assets/images/burger.jpg',
      'name': 'Cheese Burger',
      'price': '\$4.99',
      'details': '44 Calories | 20 min',
      'category': 'Burger',
      'description': 'Juicy beef patty with melted cheese.',
    },
    {
      'image': 'assets/images/pizza.jpg',
      'name': 'Veggie Pizza',
      'price': '\$9.99',
      'details': '50 Calories | 25 min',
      'category': 'Pizza',
      'description': 'Fresh vegetables on a crispy crust.',
    },
    {
      'image': 'assets/images/burger.jpg',
      'name': 'Chicken Burger',
      'price': '\$6.99',
      'details': '45 Calories | 25 min',
      'category': 'Burger',
      'description': 'Grilled chicken with special sauce.',
    },
    {
      'image': 'assets/images/salad.jpg',
      'name': 'Caesar Salad',
      'price': '\$7.99',
      'details': '30 Calories | 15 min',
      'category': 'Salad',
      'description': 'Fresh romaine with Caesar dressing.',
    },
    {
      'image': 'assets/images/pizza.jpg',
      'name': 'Margherita Pizza',
      'price': '\$8.99',
      'details': '48 Calories | 22 min',
      'category': 'Pizza',
      'description': 'Simple and classic with tomato and basil.',
    },
    {
      'image': 'assets/images/salad.jpg',
      'name': 'Greek Salad',
      'price': '\$6.99',
      'details': '28 Calories | 12 min',
      'category': 'Salad',
      'description': 'Mediterranean salad with feta cheese.',
    },
    {
      'image': 'assets/images/burger.jpg',
      'name': 'Double Burger',
      'price': '\$8.99',
      'details': '60 Calories | 30 min',
      'category': 'Burger',
      'description': 'Double patty for extra satisfaction.',
    },
  ];

  // Filter products based on selected category
  List<Map<String, dynamic>> get filteredProducts {
    if (selectedCategory == 'All') {
      return allProducts;
    }
    return allProducts
        .where((product) => product['category'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back,
              color: AppColors.primary,
            ),
          ),
        ),
        title: Text(
          'All Products',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: AppColors.primary),
              onPressed: () {
                // TODO: Implement search functionality
                print('Search pressed');
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter Section
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category['name'];
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category['name'] as String;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? AppColors.primary 
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected 
                            ? AppColors.primary 
                            : Theme.of(context).colorScheme.outline.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category['icon'] as IconData,
                          color: isSelected 
                              ? Colors.white 
                              : AppColors.primary,
                          size: 24,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category['name'] as String,
                          style: TextStyle(
                            color: isSelected 
                                ? Colors.white 
                                : AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Products Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filteredProducts.length} Products',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement sort functionality
                    print('Sort pressed');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.sort,
                        size: 18,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Sort',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Products Grid
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return Hero(
                        tag: '${product['image']}_$index',
                        child: ProductCard(
                          image: product['image'] as String,
                          name: product['name'] as String,
                          price: product['price'] as String,
                          details: product['details'] as String,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetailScreen(
                                  image: product['image'] as String,
                                  name: product['name'] as String,
                                  basePrice: product['price'] as String,
                                  details: product['details'] as String,
                                  description: product['description'] as String,
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
    );
  }
}