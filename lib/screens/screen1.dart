import 'package:flutter/material.dart';
import 'package:quickbite/screens/screen2.dart';
import 'package:quickbite/screens/screen3.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Screens for each bottom nav tab
  final List<Widget> _screens = [
    const HomeContent(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ---------------- Home Content ----------------
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.set_meal, 'label': 'Meat'},
      {'icon': Icons.fastfood, 'label': 'Fast Food'},
      {'icon': Icons.rice_bowl, 'label': 'Sushi'},
      {'icon': Icons.local_drink, 'label': 'Drinks'},
    ];

    final List<Map<String, dynamic>> bestSellers = [
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Melting Cheese Pizza',
        'price': '\$10.99',
        'details': '44 Calories | 20 min'
      },
      {
        'image': 'assets/images/burger.jpg',
        'name': 'Cheese Burger',
        'price': '\$4.99',
        'details': '44 Calories | 20 min'
      },
      {
        'image': 'assets/images/pizza.jpg',
        'name': 'Veggie Pizza',
        'price': '\$9.99',
        'details': '50 Calories | 25 min'
      },
      {
        'image': 'assets/images/burger.jpg',
        'name': 'Chicken Burger',
        'price': '\$6.99',
        'details': '45 Calories | 25 min'
      },
    ];

    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Hello 👋', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black)),
                        Text('Eddy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
                        IconButton(icon: const Icon(Icons.notifications, color: Colors.black), onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),

              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Icon(category['icon'], size: 30, color: Colors.green),
                            ),
                            const SizedBox(height: 8),
                            Text(category['label'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Promo Section
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/promotion.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('🔥 New Year Offer ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const Text('50% off on all items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        print('Claiming New Year Offer!');
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green),
                      child: const Text('Claim Offer'),
                    ),
                  ],
                ),
              ),

              // Best Sellers
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Best Sellers', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                        GestureDetector(
                          onTap: () {
                            print('Navigating to See All');
                          },
                          child: const Text('See All', style: TextStyle(fontSize: 16, color: Colors.green)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Items Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: bestSellers.length,
                      itemBuilder: (context, index) {
                        final item = bestSellers[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(item['image'], width: double.infinity, height: 120, fit: BoxFit.cover),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item['name'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(item['price'], style: const TextStyle(fontSize: 16, color: Colors.green)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item['details'], style: const TextStyle(fontSize: 14, color: Colors.black)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




