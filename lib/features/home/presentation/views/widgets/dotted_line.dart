import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DottedLine(
          direction: Axis.horizontal,
          lineLength: 266.h,
          lineThickness: 1,
          dashLength: 6,
          dashGapLength: 4,
          dashColor: Colors.black,
        ),
      ],
    );
  }
}
