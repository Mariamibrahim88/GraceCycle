import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/cubit/checkbox_cubit.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> checkboxLabels = [
      'Heart Disease',
      'Diabetes',
      'High Blood Pressure',
      'Obesity',
      'Hyperglycemia',
      'Kidney Disease',
    ];

    return BlocProvider(
      create: (context) => CheckboxCubit(),
      child: BlocBuilder<CheckboxCubit, List<bool>>(
        builder: (context, checkboxStates) {
          return Column(
              children: List.generate(checkboxLabels.length, (index) {
            return Row(
              children: [
                SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Checkbox(
                    //size of the checkbox

                    fillColor: checkboxStates[index]
                        ? MaterialStateProperty.all(AppColors.yellow)
                        : MaterialStateProperty.all(AppColors.grey),
                    side: const BorderSide(color: AppColors.grey2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),

                    value:
                        checkboxStates[index], // State for the current checkbox
                    onChanged: (value) {
                      context.read<CheckboxCubit>().toggleCheckbox(
                          index, value!); // Update the checkbox state
                    },
                    activeColor: checkboxStates[index]
                        ? AppColors.yellow
                        : Colors.grey, // Yellow if checked, grey if not
                    checkColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: Text(
                    checkboxLabels[index],
                    style: GoogleFonts.nunito(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greentit,
                    ),
                  ),
                ),
              ],
            );
          }));
        },
      ),
    );
  }
}
