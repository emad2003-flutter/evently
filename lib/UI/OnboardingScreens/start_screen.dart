import 'package:evently/UI/OnboardingScreens/onboarding.dart';
import 'package:evently/UI/Widgets/custom_elevated_bottom.dart';
import 'package:evently/UI/Widgets/custom_on_boarding.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const String routeName = '/start';
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16 * width / designWidth),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomOnBoarding(
                  title: AppLocalizations.of(context)!.on_boardin_title1,
                  description: AppLocalizations.of(
                    context,
                  )!.on_bording_pragraph_1,
                  imagePath: AppAssets.onBording1,
                ),
                SizedBox(height: 28 * height / designHeight),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: AppStyles.medium20Primary,
                    ),
                    Image.asset(AppAssets.languageSwitch),
                  ],
                ),
                SizedBox(height: 16 * height / designHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.theme,
                      style: AppStyles.medium20Primary,
                    ),
                    Image.asset(AppAssets.themeSwitch),
                  ],
                ),
                SizedBox(height: 28 * height / designHeight),
                CustomElevatedBottom(
                  onPressed: () {
                    Navigator.pushNamed(context, Onboarding.routeName);
                  },
                  text: AppLocalizations.of(context)!.lets_start,
                ),
                SizedBox(height: 16 * height / designHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
