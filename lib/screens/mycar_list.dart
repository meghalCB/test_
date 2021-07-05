// @dart=2.7

import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/add_screen.dart';
import 'package:flutterfire_samples/screens/upload_doc.dart';
import 'package:flutterfire_samples/screens/vehicle_screen.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/widgets/item_list.dart';
import 'package:flutterfire_samples/widgets/myvehicle_db.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

import 'custom_sidebar_drawer.dart';

class VehicleScreen extends StatefulWidget {
  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  FSBStatus _fsbStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: getAppBarUI('My Vehicle'),//
      ),
      /*drawer: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.transparent,
        drawer: CustomSidebarDrawer(drawerClose: (){
          setState(() {
            _fsbStatus = FSBStatus.FSB_CLOSE;
          });
        },
        ),
        screenContents: Text(''),
        status: FSBStatus.FSB_OPEN,
        *//*child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: ItemList(),
          ),
        ),*//*
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddVehicleScreen(),
            ),
          );
        },
        backgroundColor: CustomColors.firebaseOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        },
        backgroundColor: CustomColors.firebaseOrange,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),*/
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: ItemVehicleList(),
        ),
      ),
    );
  }
}
