import 'package:evently/UI/Auth/Login%20Page/login_page.dart';
import 'package:evently/UI/HomeScreen/home_screen.dart';
import 'package:evently/UI/Widgets/custom_elevated_bottom.dart';
import 'package:evently/UI/Widgets/custom_text_feild.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";
  const RegisterPage({super.key});

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
        backgroundColor: AppColors.whiteBGColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyles.medium20Primary,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryLight),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16 / designWidth * width),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.logo,
                height: 185 / designHeight * height,
                width: 136 / designWidth * width,
              ),
              SizedBox(height: 24 / designHeight * height),
              CustomTextFeild(
                prefixIcon: Image.asset(AppAssets.nameIc),
                labelText: AppLocalizations.of(context)!.name,
              ),
              SizedBox(height: 16 / designHeight * height),
              CustomTextFeild(
                prefixIcon: Image.asset(AppAssets.emailIc),
                labelText: AppLocalizations.of(context)!.email,
              ),
              SizedBox(height: 16 / designHeight * height),
              CustomTextFeild(
                prefixIcon: Image.asset(AppAssets.passwordIc),
                labelText: AppLocalizations.of(context)!.password,
                suffixIcon: Image.asset(AppAssets.unshowPasswordIc),
              ),
              SizedBox(height: 16 / designHeight * height),
              CustomTextFeild(
                prefixIcon: Image.asset(AppAssets.passwordIc),
                labelText: AppLocalizations.of(context)!.re_password,
                suffixIcon: Image.asset(AppAssets.unshowPasswordIc),
              ),
              SizedBox(height: 16 / designHeight * height),
              CustomElevatedBottom(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                text: AppLocalizations.of(context)!.create_account,
              ),
              SizedBox(height: 16 / designHeight * height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.aready_have_account,
                    style: AppStyles.medium16Black,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.login,
                      style: AppStyles.bold16Primary.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryLight,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16 / designHeight * height),
              Container(
                width: 60 / designWidth * width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: AppColors.primaryLight),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.englishIc),
                    SizedBox(width: 8 / designWidth * width),
                    Image.asset(AppAssets.arabicIc),
                  ],
                ),
              ),
              SizedBox(height: 16 / designHeight * height),
            ],
          ),
        ),
      ),
    );
  }
}
