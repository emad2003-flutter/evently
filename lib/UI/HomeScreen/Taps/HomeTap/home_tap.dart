import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Providers/event_list_provider.dart';
import 'package:evently/UI/HomeScreen/Taps/HomeTap/event_item.dart';
import 'package:evently/UI/HomeScreen/Taps/HomeTap/event_tap_item.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    var eventListProvider = Provider.of<EventListProvider>(context);
    eventListProvider.getAllEvents();
    eventListProvider.getEventListNames(context);
    eventListProvider.filterEvents();
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: AppStyles.regular14White,
            ),
            Text('Emad Mahgoub', style: AppStyles.bold24White),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset(AppAssets.themeIc)),
          Container(
            margin: EdgeInsets.only(right: (8 / designWidth) * width),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text("EN", style: AppStyles.bold14Primary),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 120 / designHeight * height,
            padding: EdgeInsets.symmetric(
              horizontal: (16 / designWidth) * width,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: (10 / designHeight) * height),
                Row(
                  children: [
                    Image.asset(AppAssets.locationIc),
                    SizedBox(width: (8 / designWidth) * width),
                    Text(
                      "${AppLocalizations.of(context)!.cairo} ,${AppLocalizations.of(context)!.egypt}",
                      style: AppStyles.medium14White,
                    ),
                  ],
                ),
                SizedBox(height: (16 / designHeight) * height),
                DefaultTabController(
                  length: eventListProvider.categories.length,
                  child: TabBar(
                    onTap: (index) {
                      eventListProvider.setSelectedIndex(index);
                    },
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorColor: AppColors.transparentColor,
                    dividerColor: AppColors.transparentColor,
                    labelPadding: EdgeInsets.zero,
                    tabs: eventListProvider.categories.map((category) {
                      return EventTapItem(
                        eventType: category,
                        isSelected:
                            eventListProvider.selectedIndex ==
                            eventListProvider.categories.indexOf(category),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: (8 / designHeight) * height),
          Expanded(
            child: eventListProvider.filteredEventList.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.no_events_exist,
                      style: AppStyles.bold14Black,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return EventItem(
                        event: eventListProvider.filteredEventList[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: (16 / designHeight) * height);
                    },
                    itemCount: eventListProvider.filteredEventList.length,
                  ),
          ),
        ],
      ),
    );
  }
}
