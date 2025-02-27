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
          lineLength: 250.h,
          lineThickness: 1,
          dashLength: 3,
          dashGapLength: 3,
          dashColor: Colors.black,
        ),
      ],
    );
  }
}
