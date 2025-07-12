import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_receiving_address_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/data/models/order_delivery_model.dart';

class ReceiveSection extends StatefulWidget {
  const ReceiveSection({super.key});

  @override
  State<ReceiveSection> createState() => _ReceiveSectionState();
}

class _ReceiveSectionState extends State<ReceiveSection> {
  @override
  void initState() {
    super.initState();
    // Initialize or restore delivery data when the section is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckoutCubit>().initializeDeliveryData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = context.read<CheckoutCubit>();

        // Get delivery data if available
        OrderDeliveryModel? deliveryData;
        if (state is GetOrderDeliverySuccess) {
          deliveryData = state.orderDelivery;
        }

        // Show loading indicator when fetching delivery data
        bool isLoadingDelivery = state is GetOrderDeliveryLoading;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Receiving  address',
                style: AppTextStyles.nunito700Size18Black,
              ),
              verticalSpace(10.h),
              CustomReceivingAddressContainer(
                asset: AppAssets.home,
                text: 'Receiving from branch',
                index: 0,
              ),
              verticalSpace(20),
              CustomReceivingAddressContainer(
                asset: AppAssets.location,
                text: 'Delivery TO My Address',
                index: 1,
              ),
              // إظهار TextField فقط عندما يكون selectedIndex = 1
              if (cubit.selectedIndex == 1)
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your delivery address *',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide:
                                const BorderSide(color: AppColors.greenButt),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: AppColors.greenButt, width: 2),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                        ),
                        onChanged: (value) {
                          // Store the address in cubit
                          cubit.setDeliveryAddress(value);
                        },
                      ),
                      if (cubit.getValidationError() != null)
                        Padding(
                          padding: EdgeInsets.only(top: 8.h, left: 16.w),
                          child: Text(
                            cubit.getValidationError()!,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              verticalSpace(10),
              // Container(
              //   height: 46.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16.r),
              //       border: Border.all(
              //         color: AppColors.greenButt,
              //         width: 1,
              //       )),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 8.w),
              //     child: Row(
              //       children: [
              //         const Icon(
              //           Icons.add_circle_outline,
              //           color: AppColors.greenButt,
              //           size: 30,
              //         ),
              //         horizontalSpace(5),
              //         Text('Add new address',
              //             style: AppTextStyles.nunito400Size16Black),
              //       ],
              //     ),
              //   ),
              // ),
              verticalSpace(50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Payment summary',
                      style: AppTextStyles.nunito700Size22GreenButt),
                  verticalSpace(15.h),
                  Row(
                    children: [
                      Text('Delivery fee',
                          style: AppTextStyles.nunito500Size18Black),
                      const Spacer(),
                      if (isLoadingDelivery)
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.greenButt),
                          ),
                        )
                      else
                        Text(
                            'EGP ${deliveryData?.deliveryFee.toStringAsFixed(2) ?? '0.00'}',
                            style: AppTextStyles.nunito500Size18Black),
                    ],
                  ),
                  verticalSpace(10.h),
                  Row(
                    children: [
                      Text('Subtotal',
                          style: AppTextStyles.nunito500Size18Black),
                      const Spacer(),
                      if (isLoadingDelivery)
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.greenButt),
                          ),
                        )
                      else
                        Text(
                            'EGP ${deliveryData?.subTotal.toStringAsFixed(2) ?? cubit.totalPrice.toStringAsFixed(2)}',
                            style: AppTextStyles.nunito500Size18Black),
                    ],
                  ),
                  verticalSpace(10.h),
                  Row(
                    children: [
                      Text('Total', style: AppTextStyles.nunito700Size18Black),
                      const Spacer(),
                      if (isLoadingDelivery)
                        SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.greenButt),
                          ),
                        )
                      else
                        Text(
                            'EGP ${deliveryData?.total.toStringAsFixed(2) ?? cubit.totalPrice.toStringAsFixed(2)}',
                            style: AppTextStyles.nunito700Size18Black),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
