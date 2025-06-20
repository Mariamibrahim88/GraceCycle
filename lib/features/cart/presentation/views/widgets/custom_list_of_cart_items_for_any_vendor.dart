import 'package:flutter/material.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/features/cart/data/models/cart_items_for_any_vendor_model.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/item_of_cart.dart';

class CustomListOfCartItemsForAnyVendor extends StatelessWidget {
  const CustomListOfCartItemsForAnyVendor({
    super.key,
    required this.cartItemsForAnyVendorModel,
  });
  final List<CartItemsForAnyVendorModel> cartItemsForAnyVendorModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItemsForAnyVendorModel.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 8,
        ),
        child: GestureDetector(
          onTap: () {
            print(
                'vendorIiiiid: ${cartItemsForAnyVendorModel[index].vendorId}');
            navigate(
                context: context,
                route: Routes.cartFull,
                arg: cartItemsForAnyVendorModel[index].vendorId);
          },
          child: ItemOfCart(
              cartItemsForAnyVendorModel: cartItemsForAnyVendorModel[index]),
        ),
      ),
    );
  }
}
