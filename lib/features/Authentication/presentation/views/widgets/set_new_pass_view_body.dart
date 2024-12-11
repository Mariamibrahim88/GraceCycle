import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grace_cycle/core/routes/app_routes.dart';
import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/core/utils/app_colors.dart';
import 'package:grace_cycle/core/utils/app_navigate.dart';
import 'package:grace_cycle/core/utils/app_spacing.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_app_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_button.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/widgets/custom_text_form_field.dart';

class SetNewPassViewBody extends StatelessWidget {
  SetNewPassViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const CustomAppBar(),
          verticalSpace(20),
          Text('Set new Password',
              style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greentit)),
          verticalSpace(15),
          SvgPicture.asset(
            AppAssets.imgSetNewPass,
            height: 170,
          ),
          verticalSpace(15),
          CustomTextFormField(
            labelText: 'New Password',
            hintText: 'anything123#',
            onChanged: (value) {},
            obscureText: true,
          ),
          verticalSpace(15),
          CustomTextFormField(
            labelText: 'Confirm Password',
            hintText: 'anything123#',
            onChanged: (value) {},
            obscureText: true,
          ),
          verticalSpace(20),
          CustomButton(
            text: 'Save',
            textColor: Colors.white,
            color: AppColors.greenButt,
            onPressed: () {
              navigate(context: context, route: Routes.succSetNewPass);
            },
          ),
        ]),
      ),
    );
  }
}
