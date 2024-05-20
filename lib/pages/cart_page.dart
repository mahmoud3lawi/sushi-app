import 'package:flutter/material.dart';
import 'package:prov9/ider/provider.dart';
import 'package:sushi_resturant_app/models/food.dart';
import 'package:sushi_resturant_app/models/shop.dart';
import 'package:sushi_resturant_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          backgroundColor: primaryColor,
        ),
        body: ListView.builder(
          itemCount: value.cart.length, // Added itemCount
          itemBuilder: (context, index) {
            // Get food from cart
            final Food food = value.cart[index];

            // Get food name
            final String foodName = food.name; // Fixed variable name

            // Get food price
            final String foodPrice = food.price;

            // Return ListTile
            return Container(
              decoration: BoxDecoration(color: SeconderyColor), // Fixed typo
              margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: ListTile(
                title: Text(
                  foodName, // Use foodName instead of undefined foodName variable
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  foodPrice,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.grey[300]),
                  onPressed: () =>
                      removeFromCart(context, food), // Added () => and context
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void removeFromCart(BuildContext context, Food food) {
    Provider.of<Shop>(context, listen: false).removeFromCart(food);
  }
}
