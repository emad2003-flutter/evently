import 'package:evently/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class EventDateOrTime extends StatelessWidget {
  String iconDateOrTime;
  String eventDateOrTime;
  String chooseDateOrTime;
  Function onPressed;

  EventDateOrTime({
    super.key,
    required this.iconDateOrTime,
    required this.eventDateOrTime,
    required this.chooseDateOrTime,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Row(
      children: [
        Image.asset(iconDateOrTime),

        SizedBox(width: 10 * designWidth / width),

        Text(eventDateOrTime, style: AppStyles.medium16Black),

        const Spacer(),

        TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(chooseDateOrTime, style: AppStyles.medium16Primary),
        ),
      ],
    );
  }
}
