import 'package:flutter/material.dart';
import 'package:grocery_custom_animation/constants.dart';
import 'package:grocery_custom_animation/screens/deatils/components/rounded_icon_btn.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F6),
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Row(
        children: [
          RoundIconBtn(
            iconData: Icons.remove,
            color: Colors.black38,
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 4),
            child: Text(
              "1",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
          RoundIconBtn(
            iconData: Icons.add,
            press: () {},
          ),
        ],
      ),
    );
  }
}
