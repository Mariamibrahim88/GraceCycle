import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/customer_reviewe_section.dart';
import 'package:grace_cycle/features/details/presentation/views/widgets/green_butt_text.dart';

class ListOfCustomerReviewsSection extends StatelessWidget {
  const ListOfCustomerReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: const CustomerReviewSection(),
              );
            }),
        GreenButtText(
          text: 'See all reviews',
          leftPadding: 0.w,
        ),
      ],
    );
  }
}
