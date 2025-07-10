import 'package:flutter/material.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/features/details/data/models/vendor_item_details_model.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/item_offer_card.dart';

class CustomListItemOffered extends StatelessWidget {
  const CustomListItemOffered({
    super.key,
    required this.offeredItemList,
  });
  final List<OfferedItem> offeredItemList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: offeredItemList.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.foodDetails,
            arguments: offeredItemList[index].id,
          );
        },
        child: ItemOfferedCard(
          offeredItem: offeredItemList[index],
        ),
      ),
    );
  }
}
