import 'package:flutter/material.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/item_of_order.dart';

class CustomListOfOrdersItems extends StatelessWidget {
  const CustomListOfOrdersItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        child: ItemOfOrder(),
      ),
    );
  }
}
