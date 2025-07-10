import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';
import 'package:grace_cycle/features/orders/data/models/order_details_model.dart';

class ListOfNameOfFoodCheckout extends StatelessWidget {
  const ListOfNameOfFoodCheckout({super.key, required this.paymentSummary});
  final PaymentSummary paymentSummary;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: 10.h,
        ),
        child: Row(
          children: [
            Text(
                '${paymentSummary.items[index].productName} *${paymentSummary.items[index].quantity}',
                style: AppTextStyles.nunito500Size18Black),
            const Spacer(),
            Text('EGP ${paymentSummary.items[index].total}',
                style: AppTextStyles.nunito500Size18Black),
          ],
        ),
      ),
    );
  }
}
