import 'package:evently/Providers/event_list_provider.dart';
import 'package:evently/UI/HomeScreen/Taps/HomeTap/event_item.dart';
import 'package:evently/UI/Widgets/custom_text_feild.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({super.key});

  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getFavoriteEvents();
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // design width and height
    var designWidth = 393;
    var designHeight = 841;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: (16 / designHeight) * height),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: (8 / designWidth) * width,
              ),
              child: CustomTextFeild(
                borderColor: AppColors.primaryLight,
                hintText: AppLocalizations.of(context)!.search_for_event,
                hintStyle: AppStyles.bold14Primary,
                prefixIcon: Image.asset(AppAssets.searchIc),
              ),
            ),
            SizedBox(height: (8 / designHeight) * height),
            Expanded(
              child: eventListProvider.favoriteEventList.isEmpty
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.no_events_exist,
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        return EventItem(
                          event: eventListProvider.favoriteEventList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: (16 / designHeight) * height);
                      },
                      itemCount: eventListProvider.favoriteEventList.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
