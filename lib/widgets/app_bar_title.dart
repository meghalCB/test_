import 'package:flutter/material.dart';
import 'package:flutterfire_samples/HomeScreen/design_course_app_theme.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';

// class AppBarTitle extends StatelessWidget {
//   @override
  // Widget build(BuildContext context) {


      Widget getAppBarUI(String s) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  /* Text(
                  'Choose your',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: DesignCourseAppTheme.grey,
                  ),
                ),*/
                  Text(
                    s,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 0.27,
                      color: DesignCourseAppTheme.darkerText,
                    ),
                  ),
                ],
              ),
            ),
            /*Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/design_course/userImage.png'),
          )*/
          ],
        ),
      );
    }
    /*Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/fevi.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Vehi',
          style: TextStyle(
            color: CustomColors.firebaseYellow,
            fontSize: 18,
          ),
        ),
        Text(
          'Brain',
          style: TextStyle(
            color: CustomColors.firebaseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );*/
  // }
// }


