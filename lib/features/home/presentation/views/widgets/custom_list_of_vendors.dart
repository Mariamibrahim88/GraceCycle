import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_list_of_shimmer_hor.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_cubit.dart';
import 'package:grace_cycle/features/home/presentation/manager/Home_cubit/home_state.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/custom_list_of_vendor_hor.dart';

class CustomListOfVendors extends StatelessWidget {
  const CustomListOfVendors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeVendorSuccess ||
            current is HomeUpdateVendorFavorites ||
            current is HomeVendorLoading,
        builder: (BuildContext context, state) {
          final homeCubit = BlocProvider.of<HomeCubit>(context);
          final vendorMenuModel = homeCubit.vendorsModel;
          if (state is HomeVendorLoading && vendorMenuModel == null) {
            return const CustomListOfShimmerHor();
          }
          if (vendorMenuModel == null) {
            return const CustomListOfShimmerHor();
          }
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: vendorMenuModel.vendors.entries.map((vendor) {
                return CustomListOfVendorHor(
                  vendor: vendor.value,
                  vendorCategory: vendor.key,
                );
              }).toList(),
            ),
          );
        });
  }
}
