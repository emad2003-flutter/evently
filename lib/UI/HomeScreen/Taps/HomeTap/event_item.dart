import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: (8 / designWidth) * width),
      height: (300 / designHeight) * height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryLight, width: 1),
        image: const DecorationImage(
          image: AssetImage(AppAssets.birthday),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: (12 / designWidth) * width,
              vertical: (8 / designHeight) * height,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: (8 / designWidth) * width,
              vertical: (8 / designHeight) * height,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteBGColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.primaryLight, width: 1),
            ),
            child: Column(
              children: [
                Text(
                  "22",
                  style: AppStyles.bold20Primary,
                  textAlign: TextAlign.center,
                ),
                Text("Nov", style: AppStyles.bold14Primary),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: (8 / designWidth) * width,
              vertical: (8 / designHeight) * height,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: (8 / designWidth) * width,
              vertical: (16 / designHeight) * height,
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteBGColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "This is a Birthday Party.",
                    style: AppStyles.bold14Black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage(AppAssets.favorateIcUnselected),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
