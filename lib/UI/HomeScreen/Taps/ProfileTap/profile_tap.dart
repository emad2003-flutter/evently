import 'package:evently/Providers/localization_provider.dart';
import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/UI/HomeScreen/Taps/ProfileTap/language_bottom_sheet.dart';
import 'package:evently/UI/HomeScreen/Taps/ProfileTap/theme_bottom_sheet.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var designWidth = 393;
    var designHeight = 841;
    var localizationProvider = Provider.of<LocalizationProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                fit: BoxFit.cover,
                width: 100 / designWidth * width,
                height: 100 / designWidth * width,
                AppAssets.profilePhoto,
              ),
            ),
            SizedBox(width: 16 / designWidth * width),
            Column(
              children: [
                Text("Emad Mahgoub", style: AppStyles.bold24White),
                Text("emad@example.com", style: AppStyles.medium16White),
              ],
            ),
          ],
        ),
        toolbarHeight: height * 0.18,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(46)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (16 / designWidth) * width,
          vertical: (16 / designHeight) * height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                // Handle language selection
                showLanguageBottomSheet(context);
              },
              child: Container(
                width: (361 / designWidth) * width,
                height: (105 / designHeight) * height,
                padding: EdgeInsets.symmetric(
                  horizontal: (16 / designWidth) * width,
                  vertical: (16 / designHeight) * height,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      localizationProvider.currentLocal == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: AppStyles.bold20Primary,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primaryLight,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                // Handle language selection
                print(themeProvider.isDarkMode());
                showThemeBottomSheet(context);
              },
              child: Container(
                width: (361 / designWidth) * width,
                height: (105 / designHeight) * height,
                padding: EdgeInsets.symmetric(
                  horizontal: (16 / designWidth) * width,
                  vertical: (16 / designHeight) * height,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primaryLight, width: 2),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      themeProvider.currentTheme == ThemeData.light()
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: AppStyles.bold20Primary,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.primaryLight,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                padding: EdgeInsets.symmetric(
                  horizontal: (16 / designWidth) * width,
                  vertical: (16 / designHeight) * height,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                // Handle logout
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    color: AppColors.whiteColor,
                    size: 25,
                  ),
                  SizedBox(width: width * 0.02),
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: AppStyles.regular20White,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const ThemeBottomSheet(),
    );
  }
}
