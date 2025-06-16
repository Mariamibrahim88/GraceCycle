import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/custom_review_container.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/head_vendor_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/icon_data_vendor_details.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/items_offered_section.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/rating_bar_widget.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/rating_linear_progress_indicator.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/title_and_icon.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/vendor_details_card.dart';
import 'package:grace_cycle/features/home/presentation/views/widgets/vendor_card.dart';

class VendorDetailsViewBody extends StatelessWidget {
  const VendorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      buildWhen: (previous, current) =>
          current is GetVendorByIdLoading ||
          current is GetVendorByIdFailure ||
          current is GetVendorByIdSuccess,
      builder: (context, state) {
        if (state is GetVendorByIdLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetVendorByIdFailure) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetVendorByIdSuccess) {
          final vendorDetailsModel = state.vendorItemDetails;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VendorDetailsCard(
                  vendorItemModel: vendorDetailsModel,
                ),
                verticalSpace(15.h),
                HeadVendorDetails(vendorItemModel: vendorDetailsModel),
                verticalSpace(5.h),
                ContainerVendorIconDataDetails(
                  icon: Icons.location_on_outlined,
                  text: vendorDetailsModel.address,
                ),
                verticalSpace(5.h),
                ContainerVendorIconDataDetails(
                  icon: Icons.access_time,
                  text:
                      'Open from ${vendorDetailsModel.opening} AM to ${vendorDetailsModel.closing} PM',
                ),
                verticalSpace(5.h),
                const ContainerVendorIconDataDetails(
                  icon: Icons.near_me_outlined,
                  text: 'It is 10 km away from you',
                ),
                verticalSpace(15.h),
                ItemsOfferedSection(
                  offeredItemList: vendorDetailsModel.itemsOffered,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(20),
                      GestureDetector(
                        onTap: () {},
                        child: const TitleAndIcon(
                          title: 'Ratings and Reviews',
                        ),
                      ),
                      verticalSpace(5),
                      Row(
                        children: [
                          RatingBarWidget(
                            rating: vendorDetailsModel.rating,
                          ),
                          const RatingLinearProgressIndicator(
                            oneStar: 1,
                            twoStar: 2,
                            threeStar: 3,
                            fourStar: 4,
                            fiveStar: 0,
                            totalReviews: 10,
                          ),
                        ],
                      ),
                      verticalSpace(18),
                      // const ListOfCustomerReviewsSection(
                      //   foodItemDetailsModel: foodItemDetailsModel,

                      // ),
                    ],
                  ),
                ),
                const CustomReviewContainer(
                  title: 'Rate this vendor',
                ),
                verticalSpace(20.h),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: TitleAndIcon(
                    title: 'Similar Restaurant',
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 250.h,
                          child: ListView.builder(
                            itemCount: vendorDetailsModel.similarItems.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.vendorDetails,
                                  arguments: vendorDetailsModel
                                      .similarItems[index].userId,
                                );
                              },
                              child: VendorCard(
                                vendorItemModel:
                                    vendorDetailsModel.similarItems[index],
                              ),
                            ),
                            // itemCount: vendor.length,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
