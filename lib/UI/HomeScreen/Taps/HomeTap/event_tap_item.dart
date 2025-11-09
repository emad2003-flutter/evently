import 'package:evently/Providers/theme_provider.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventTapItem extends StatelessWidget {
  String eventType;
  bool isSelected;
  EventTapItem({super.key, required this.eventType, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Container(
      margin: EdgeInsets.only(right: (8 / designWidth) * width),
      padding: EdgeInsets.symmetric(
        horizontal: (16 / designWidth) * width,
        vertical: (8 / designHeight) * height,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).focusColor
            : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: AppColors.whiteColor, width: 1),
      ),
      child: Text(
        eventType,
        style: isSelected
            ? Theme.of(context).textTheme.headlineSmall
            : AppStyles.medium16White,
      ),
    );
  }
}
