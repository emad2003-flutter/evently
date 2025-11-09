import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var designWidth = 393;
    var designHeight = 841;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (16 / designWidth) * width,
        vertical: (24 / designHeight) * height,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              // Todo: Change theme to light
              themeProvider.changeLocale(ThemeData.light());
              Navigator.pop(context);
            },
            child: themeProvider.currentTheme == ThemeData.light()
                ? getSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.light,
                  )
                : getUnSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.light,
                  ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              //Todo: Change language to Arabic
              themeProvider.changeLocale(ThemeData.dark());
              Navigator.pop(context);
            },
            child: themeProvider.currentTheme == ThemeData.dark()
                ? getSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.dark,
                  )
                : getUnSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.dark,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          theme,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.primaryLight),
        ),
        const Icon(Icons.check, color: AppColors.primaryLight, size: 40),
      ],
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String theme) {
    return Text(theme, style: Theme.of(context).textTheme.headlineLarge);
  }
}
