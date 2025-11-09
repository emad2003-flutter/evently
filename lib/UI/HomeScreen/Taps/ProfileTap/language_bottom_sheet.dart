import 'package:evently/Providers/localization_provider.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // to make responsive
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var designWidth = 393;
    var designHeight = 841;
    var localizationProvider = Provider.of<LocalizationProvider>(context);

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
              // Todo: Change language to English
              localizationProvider.changeLocale('en');
              Navigator.pop(context);
            },
            child: localizationProvider.currentLocal == 'en'
                ? getSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.english,
                  )
                : getUnSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.english,
                  ),
          ),
          SizedBox(height: height * 0.02),
          InkWell(
            onTap: () {
              //Todo: Change language to Arabic
              localizationProvider.changeLocale('ar');
              Navigator.pop(context);
            },
            child: localizationProvider.currentLocal == 'ar'
                ? getSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.arabic,
                  )
                : getUnSelectedItemWidget(
                    context,
                    AppLocalizations.of(context)!.arabic,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: Theme.of(
            context,
          ).textTheme.headlineLarge!.copyWith(color: AppColors.primaryLight),
        ),
        const Icon(Icons.check, color: AppColors.primaryLight, size: 40),
      ],
    );
  }

  Widget getUnSelectedItemWidget(BuildContext context, String language) {
    return Text(language, style: Theme.of(context).textTheme.headlineLarge);
  }
}
