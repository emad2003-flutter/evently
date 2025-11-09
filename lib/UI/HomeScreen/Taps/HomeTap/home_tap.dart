import 'package:evently/UI/HomeScreen/Taps/HomeTap/event_item.dart';
import 'package:evently/UI/HomeScreen/Taps/HomeTap/event_tap_item.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // categories list
    List<String> categories = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];

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
                  length: categories.length,
                  child: TabBar(
                    onTap: (index) {
                      selectedIndex = index;
                      setState(() {});
                    },
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorColor: AppColors.transparentColor,
                    dividerColor: AppColors.transparentColor,
                    labelPadding: EdgeInsets.zero,
                    tabs: categories.map((category) {
                      return EventTapItem(
                        eventType: category,
                        isSelected:
                            selectedIndex == categories.indexOf(category),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: (8 / designHeight) * height),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return const EventItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: (16 / designHeight) * height);
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
