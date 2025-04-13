import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/widgets/custom_loading.dart';
import 'package:grace_cycle/core/widgets/custom_no_found_items.dart';
import 'package:grace_cycle/features/discover/presentation/manager/discover_cubit/discover_cubit.dart';
import 'package:grace_cycle/features/discover/presentation/views/widgets/custom_list_of_shimmer_ver.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class DiscoverVendorsList extends StatelessWidget {
  const DiscoverVendorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      buildWhen: (previous, current) =>
          current is DiscoverVendorSuccess ||
          current is DiscoverVendorLoading ||
          current is DiscoverVendorPaginationLoading ||
          current is DiscoverVendorFailure,
      builder: (context, state) {
        final discoverCubit = BlocProvider.of<DiscoverCubit>(context);
        if (state is DiscoverVendorLoading &&
            discoverCubit.vendorList.isEmpty) {
          return const CustomListOfShimmerVer();
        } else if (state is DiscoverVendorSuccess ||
            (state is DiscoverVendorPaginationLoading &&
                discoverCubit.vendorList.isNotEmpty)) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification &&
                  !discoverCubit.isLoadingVendors) {
                discoverCubit.getVendorDiscover(
                  loadingFromPagination: true,
                );
              }
              return false;
            },
            child: ListView.builder(
                itemCount: discoverCubit.vendorList.length + 1,
                itemBuilder: (context, index) {
                  if (index < discoverCubit.vendorList.length) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 10.0,
                        bottom: 8,
                        top: 8,
                      ),
                      child: VendorCard(
                        vendorItemModel: discoverCubit.vendorList[index],
                      ),
                    );
                  } else {
                    if (discoverCubit.isLoadingVendors) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: CustomLoading(),
                        ),
                      );
                    } else if (!discoverCubit.hasMoreVendors) {
                      if (discoverCubit.serachController.text.isNotEmpty &&
                          discoverCubit.vendorList.isEmpty) {
                        return const CustomNoFoundItems(
                          title: 'No vendors found!',
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'No more vendors',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                }),
          );
        }
        return const SizedBox();
      },
    );
  }
}
