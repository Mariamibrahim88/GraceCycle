import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          current is DiscoverVendorSuccess || current is DiscoverVendorLoading,
      builder: (context, state) {
        if (state is DiscoverVendorLoading) {
          return const CustomListOfShimmerVer();
        } else if (state is DiscoverVendorSuccess) {
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent &&
                  notification is ScrollUpdateNotification) {
                BlocProvider.of<DiscoverCubit>(context).getVendorDiscover(
                  loadingFromPagination: false,
                );
              }
              return true;
            },
            child: Column(
              children: [
                Expanded(
                  child: state.vendorList.isEmpty
                      ? const CustomNoFoundItems(title: 'No vendors found!')
                      : ListView.builder(
                          itemCount: state.vendorList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 10.0,
                              bottom: 8,
                              top: 8,
                            ),
                            child: VendorCard(
                              vendorItemModel: state.vendorList[index],
                            ),
                          ),
                        ),
                ),
                // state is DiscoverVendorPaginationLoading
                //     ? const CustomLoading()
                //     : const SizedBox.shrink(),
              ],
            ),
          );
        }
        // return const SizedBox();
        return const CustomListOfShimmerVer();
      },
    );
  }
}
