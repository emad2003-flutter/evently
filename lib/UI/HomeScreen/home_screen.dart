import 'package:evently/UI/HomeScreen/Taps/HomeTap/home_tap.dart';
import 'package:evently/UI/HomeScreen/Taps/MapTap/map_tap.dart';
import 'package:evently/UI/HomeScreen/Taps/ProfileTap/profile_tap.dart';
import 'package:evently/UI/HomeScreen/Taps/favoriteTap/favorite_tap.dart';
import 'package:evently/UI/HomeScreen/create_event.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [
    const HomeTap(),
    const MapTap(),
    const FavoriteTap(),
    const ProfileTap(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        color: Theme.of(context).primaryColor,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            buildBottomNavigationBarItem(
              iconPath: currentIndex == 0
                  ? AppAssets.homeIcSelected
                  : AppAssets.homeIcUnselected,
              label: AppLocalizations.of(context)!.home,
              index: currentIndex,
            ),
            buildBottomNavigationBarItem(
              iconPath: currentIndex == 1
                  ? AppAssets.mapIcSelected
                  : AppAssets.mapIcUnselected,
              label: AppLocalizations.of(context)!.map,
              index: currentIndex,
            ),
            buildBottomNavigationBarItem(
              iconPath: currentIndex == 2
                  ? AppAssets.favorateIcSlected
                  : AppAssets.favorateIcUnselected,
              label: AppLocalizations.of(context)!.love,
              index: currentIndex,
            ),
            buildBottomNavigationBarItem(
              iconPath: currentIndex == 3
                  ? AppAssets.progileIcSelected
                  : AppAssets.profileIcUnselected,
              label: AppLocalizations.of(context)!.profile,
              index: currentIndex,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateEvent.routeName);
        },
        shape: const CircleBorder(
          side: BorderSide(color: AppColors.whiteColor, width: 6),
        ),
        elevation: 6,
        child: const Icon(Icons.add, color: AppColors.whiteColor, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: taps[currentIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(icon: Image.asset(iconPath), label: label);
  }
}
