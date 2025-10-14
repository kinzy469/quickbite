import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 👇 Reusable cart item function
    Widget buildCartItem({
      required String title,
      required String subtitle,
      required double price,
      required String emoji,
    }) {
      return Card(
        color: Colors.green, // 👈 Green background for the card
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // 👈 Title text color
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70, // 👈 Subtitle text color
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white, // 👈 Price color
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: const [
                  Icon(
                    Icons.remove_circle_outline,
                    color: Colors.white,
                  ), // 👈 Icon color
                  SizedBox(width: 6),
                  Text(
                    '1',
                    style: TextStyle(color: Colors.white),
                  ), // 👈 Quantity color
                  SizedBox(width: 6),
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                  ), // 👈 Icon color
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white, // 👈 Set screen background to white
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // 👈 Back button
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🧾 Cart Items
            Expanded(
              child: ListView(
                children: [
                  buildCartItem(
                    title: 'Melting Cheese Pizza',
                    subtitle: 'Pizza Italiano',
                    price: 11.88,
                    emoji: '🍕',
                  ),
                  buildCartItem(
                    title: 'Chicken Salad',
                    subtitle: 'Meat House',
                    price: 4.56,
                    emoji: '🥗',
                  ),
                  buildCartItem(
                    title: 'Cheese Burger',
                    subtitle: 'Burger Hunt',
                    price: 4.99,
                    emoji: '🍔',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🏷 Promo Code Section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Promo code',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {}, child: const Text('Apply', style: TextStyle(color: Colors.white),)),
              ],
            ),

            const SizedBox(height: 20),

            // 💵 Price Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Subtotal', style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('\$21.43', style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Delivery', style: TextStyle(fontSize: 16, color: Colors.black)),
                Text('\$5.00', style: TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  '\$26.43',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ Checkout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Checkout - \$26.43',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
