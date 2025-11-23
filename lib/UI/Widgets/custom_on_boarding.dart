import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomOnBoarding extends StatelessWidget {
  String title;
  String description;
  String imagePath;
  CustomOnBoarding({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 28 * height / designHeight),
        Center(child: Image.asset(AppAssets.brandingForOnboarding)),
        SizedBox(height: 28 * height / designHeight),
        Center(child: Image.asset(imagePath)),
        SizedBox(height: 28 * height / designHeight),
        Text(title, style: AppStyles.bold20Primary),
        SizedBox(height: 28 * height / designHeight),
        Text(description, style: AppStyles.medium16Black),
        SizedBox(height: 28 * height / designHeight),
      ],
    );
  }
}
