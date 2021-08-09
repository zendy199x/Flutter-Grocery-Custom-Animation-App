import 'package:flutter/material.dart';
import 'package:grocery_custom_animation/constants.dart';
import 'package:grocery_custom_animation/controllers/home_controller.dart';
import 'package:grocery_custom_animation/screens/home/components/cart_details_view_card.dart';

class CartDetailView extends StatelessWidget {
  const CartDetailView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Cart", style: Theme.of(context).textTheme.headline6),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(
              productItem: controller.cart[index],
            ),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Next - \$40"),
            ),
          ),
        ],
      ),
    );
  }
}
