import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/presentation/views/widgets/custom_list_of_order_items.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 35,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: Text(
              'Orders',
              style: AppTextStyles.nunito700Size22Black,
            ),
          ),
          TabBar(
            onTap: (index) {
              //favCubit.changeTap(index);
            },
            labelStyle: AppTextStyles.nunito700Size16GreenButt,
            unselectedLabelStyle: AppTextStyles.nunito700Size16Black,
            indicatorColor: AppColors.greenButt,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: 'Current'),
              Tab(text: 'Past'),
            ],
          ),
          verticalSpace(20),
          const Expanded(
            child: IndexedStack(
              index: 0,
              children: [
                CustomListOfOrdersItems()
                // FavVendorsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
