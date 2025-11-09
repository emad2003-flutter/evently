import 'package:evently/UI/Widgets/custom_elevated_bottom.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeName = "/forget_password";
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forget_password,
          style: AppStyles.medium20Primary,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryLight),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteBGColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 / designWidth * width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.forgetPassword),
            SizedBox(height: 24 / designHeight * height),
            CustomElevatedBottom(
              onPressed: () {},
              text: AppLocalizations.of(context)!.reset_password,
            ),
          ],
        ),
      ),
    );
  }
}
