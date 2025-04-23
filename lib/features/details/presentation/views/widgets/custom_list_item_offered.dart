import 'package:flutter/material.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/item_offer_card.dart';

class CustomListItemOffered extends StatelessWidget {
  const CustomListItemOffered({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) => const ItemOfferedCard(),
    );
  }
}
