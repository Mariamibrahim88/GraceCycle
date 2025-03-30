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
        builder: (BuildContext context, state) {
      if (state is HomeVendorLoading) {
        return const CustomListOfShimmerHor();
      } else if (state is HomeVendorSuccess) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: state.vendorsModel.vendors.entries.map((vendor) {
              return CustomListOfVendorHor(
                vendor: vendor.value,
                vendorCategory: vendor.key,
              );
            }).toList(),
          ),
        );
      }
      return const Text('Erroooooooooooooooooooooooooooooooooooooooor');
    });
  }
}
