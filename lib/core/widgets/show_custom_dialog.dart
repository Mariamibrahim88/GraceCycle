import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_text_styles.dart';

Future<dynamic> showCustomDialog(
    BuildContext context, String message, String image, double height) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors.basicWhite,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: SizedBox(
          height: 400.h,
          width: 400.w,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: AppTextStyles.nunito700Size18Black,
              ),
              SizedBox(
                height: 20.h,
              ),
              Image(image: AssetImage(image), height: height, width: 200.w),
            ],
          ),
        ),
      );
    },
  );
}
