import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_bottom_cart_nav_bar.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/food_details_body.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(sl()),
        child: const Scaffold(
          backgroundColor: AppColors.basicWhite,
          body: FoodDetailsBody(),
          bottomNavigationBar: CustomBottomCartNavBar(),
        ),
      ),
    );
  }
}
