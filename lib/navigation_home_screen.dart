import 'package:flutterfire_samples/app_theme.dart';
import 'package:flutterfire_samples/custom_drawer/drawer_user_controller.dart';
import 'package:flutterfire_samples/custom_drawer/home_drawer.dart';
/*import 'package:flutterfire_samples/feedback_screen.dart';
import 'package:flutterfire_samples/help_screen.dart';
import 'package:flutterfire_samples/home_screen.dart';
import 'package:flutterfire_samples/invite_friend_screen.dart';*/
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/dashboard_screen.dart';
import 'package:flutterfire_samples/screens/mycar_list.dart';
import 'package:flutterfire_samples/screens/mydocuments_list.dart';
import 'package:flutterfire_samples/screens/mytransaction_list.dart';
import 'package:flutterfire_samples/screens/myvehicle.dart';
import 'package:flutterfire_samples/screens/upload_doc.dart';

import 'HomeScreen/home_design_course.dart';
import 'home_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = DesignCourseHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = DesignCourseHomeScreen();
        });
      } else if (drawerIndex == DrawerIndex.MYVehicle) {
        setState(() {
          screenView = VehicleScreen();//myvehicle
        });
      }else if (drawerIndex == DrawerIndex.MyTransaction) {
        setState(() {
          screenView = TransactionScreen();//myvehicle
        });
      }else if (drawerIndex == DrawerIndex.Documents) {
        setState(() {
          screenView = DocumentScreen(); //ImageUpload
        });
      }
      /*else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = DashboardScreen();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = DashboardScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = DashboardScreen();
        });
      } else {
        //do in your way......
      }*/
    }
  }
}
