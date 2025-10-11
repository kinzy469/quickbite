// Dummy Cart screen
import 'package:flutter/material.dart';
import 'package:quickbite/screens/screen1.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreen();
}

class _CartScreen extends State<CartScreen> {
  String selectedSize = 'Medium';
  bool addChicken = true;
  bool addMushroom = false;

  double basePrice = 10.99;
  double chickenPrice = 1.40;
  double mushroomPrice = 0.40;

  double get totalPrice {
    double total = basePrice;
    if (addChicken) total += chickenPrice;
    if (addMushroom) total += mushroomPrice;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/pizza.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),

                Positioned(
                  top: 16,
                  right: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.favorite_border, color: Colors.black),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.share, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Melting Cheese Pizza",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pizza Italiano • ",
                  style: TextStyle(color: Colors.green),
                ),
                Icon(Icons.star, color: Colors.orange, size: 18),
                Text(" 4.8 (2.2k)", style: TextStyle(color: Colors.green)),
              ],
            ),
            const SizedBox(height: 20),
            // Pizza Size Options Styled Like UI
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  ['Small', 'Medium', 'Large'].map((size) {
                    bool isSelected = selectedSize == size;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size;
                          if (size == 'Small') basePrice = 8.99;
                          if (size == 'Medium') basePrice = 10.99;
                          if (size == 'Large') basePrice = 12.99;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green, width: 1),
                        ),
                        child: Text(
                          "${size == 'Small'
                              ? '6"'
                              : size == 'Medium'
                              ? '8"'
                              : '10"'} $size",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Ingredients",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  IngredientTile(
                    name: "Chicken",
                    quantity: "220 gm",
                    price: chickenPrice,
                    isSelected: addChicken,
                    onChanged: (value) => setState(() => addChicken = value),
                  ),
                  IngredientTile(
                    name: "Mushroom",
                    quantity: "16 gm",
                    price: mushroomPrice,
                    isSelected: addMushroom,
                    onChanged: (value) => setState(() => addMushroom = value),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add to Cart - \$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
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
  final ValueChanged<bool> onChanged;

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
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          onChanged: (value) => onChanged(value ?? false),
        ),
        Expanded(
          child: Text(
            "$name ($quantity)",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Text("+ \$${price.toStringAsFixed(2)}"),
      ],
    );
  }
}
