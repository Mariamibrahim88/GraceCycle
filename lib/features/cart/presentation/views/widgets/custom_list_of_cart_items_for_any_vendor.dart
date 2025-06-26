import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
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
          onTap: () async {
            final shouldRefresh = await Navigator.pushNamed(
              context,
              Routes.cartFull,
              arguments: cartItemsForAnyVendorModel[index].vendorId,
            );
            if (shouldRefresh == true) {
              context.read<CartCubit>().getCartItemsForAnyVendor();
            }
          },
          child: ItemOfCart(
              cartItemsForAnyVendorModel: cartItemsForAnyVendorModel[index]),
        ),
      ),
    );
  }
}
