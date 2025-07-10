import 'package:flutter/material.dart';
import 'package:grace_cycle/features/orders/data/models/order_details_model.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/item_of_order_section.dart';

class CustomListOfItemsInOrderSection extends StatelessWidget {
  const CustomListOfItemsInOrderSection(
      {super.key, required this.orderDetailsModel});
  final OrderDetailsModel orderDetailsModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: orderDetailsModel.items.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ItemOfOrderSection(
                orderItem: orderDetailsModel.items[index],
              ),
            ),
          ],
        );
      },
    );
  }
}
