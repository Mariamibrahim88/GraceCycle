import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.green,
        ));
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
        //  [
        //     const HeaderOfVendorName(title: 'Restaurant nearby'),
        //     CustomListOfVendorHor(
        //       vendorImage: AppAssets.restaurant,
        //       vendorName: 'Al Shallal Restaurant',
        //       vendorAddress: 'Ahmed Hassan Al-Bakoury Street',
        //       vendorTime: 'from 10:00 AM to 12:00 AM',
        //       vendorDistance: '5.7 km',
        //       vendorLogo: AppAssets.restauratLogo,
        //     ),
        //     const HeaderOfVendorName(title: 'Supermarkets nearby'),
        //     CustomListOfVendorHor(
        //       vendorImage: AppAssets.supermarket,
        //       vendorName: 'Hyper One',
        //       vendorAddress: 'Misr Ismailia Desert Road, Sharkia',
        //       vendorTime: 'from 10:00 AM to 12:00 AM',
        //       vendorDistance: '5.7 km',
        //       vendorLogo: AppAssets.supermarketLogo,
        //     ),
        //     verticalSpace(10),
        //     const HeaderOfVendorName(title: 'Bakery nearby'),
        //     CustomListOfVendorHor(
        //       vendorImage: AppAssets.restaurant,
        //       vendorName: 'Al Shallal Restaurant',
        //       vendorAddress: 'Ahmed Hassan Al-Bakoury Street',
        //       vendorTime: 'from 10:00 AM to 12:00 AM',
        //       vendorDistance: '5.7 km',
        //       vendorLogo: AppAssets.restauratLogo,
        //     ),
        //     const HeaderOfVendorName(title: 'Cafe nearby'),
        //     CustomListOfVendorHor(
        //       vendorImage: AppAssets.restaurant,
        //       vendorName: 'Al Shallal Restaurant',
        //       vendorAddress: 'Ahmed Hassan Al-Bakoury Street',
        //       vendorTime: 'from 10:00 AM to 12:00 AM',
        //       vendorDistance: '5.7 km',
        //       vendorLogo: AppAssets.restauratLogo,
        //     ),
        //   ]),
        // );
      }
     return const Text('Erroooooooooooooooooooooooooooooooooooooooor');
    });
  }
}
