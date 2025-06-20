import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_safe_area.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(sl()),
          ),
          BlocProvider(
            create: (context) {
              final cubit = CartCubit(sl());
              cubit.getCartItemsForAnyVendor();
              return cubit;
            },
          ),
        ],
        child: const CartViewBody(),
      ),
    );
  }
}
