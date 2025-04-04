import 'package:flutter/material.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_list_of_categorized_food.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomHomeAppBar(),
        SliverToBoxAdapter(child: verticalSpace(10)),
        const SliverToBoxAdapter(child: ListOfCategorizedFood()),
        SliverToBoxAdapter(child: verticalSpace(10)),
        // BlocProvider(
        //   create: (context) => HomeCubit(sl())..getVendors(),
        //   child: const SliverToBoxAdapter(child: CustomListOfVendors()),
        // ),
      ],
    );
  }
}
