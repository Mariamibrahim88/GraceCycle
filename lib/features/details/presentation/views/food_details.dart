import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_bottom_cart_nav_bar.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/food_details_body.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.basicWhite,
            body: BlocProvider(
              create: (context) => DetailsCubit(),
              child: const FoodDetailsBody(),
            ),
            bottomNavigationBar: const CustomBottomCartNavBar()));
  }
}
