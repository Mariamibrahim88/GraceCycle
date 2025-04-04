import 'package:flutter/material.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/item_of_cart.dart';

class CustomListOfCartItems extends StatelessWidget {
  const CustomListOfCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: ItemOfCart(),
      ),
    );
  }
}
