import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
   CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.onChanged,
    this.obscureText = true,
    this.icon,
    this.textcontroller, 
    this.validator,
  });

  final String hintText;
  final String? labelText;
  final Function(String)? onChanged;
  final bool obscureText;
  final IconData? icon;
  final TextEditingController? textcontroller;
  FormFieldValidator<String>? validator;
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 355.w,
      height: 45.h,
      child: TextFormField(
        cursorColor: AppColors.greentit,
        controller: widget.textcontroller,
        validator:  widget.validator??(value) {
          if (value!.isEmpty) {
            return 'required field';
          }
          return null;
        },
        onChanged: widget.onChanged,
        obscureText: widget.obscureText && _obscureText,
        decoration: InputDecoration(
          //contentPadding: EdgeInsets.only(left: 10.w),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: GoogleFonts.nunito(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greentit),
          labelText: widget.labelText,
          hintStyle: GoogleFonts.nunito(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey),
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.greenBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: AppColors.greenBorder, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide:
                  const BorderSide(color: AppColors.greenBorder, width: 1)),
        ),
      ),
    );
  }
}
