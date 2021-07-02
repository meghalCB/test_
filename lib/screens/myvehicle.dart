// @dart=2.9

import 'dart:convert';

import 'package:card_selector/card_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/vehicle_screen.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/widgets/transaction_card.dart';
import 'package:flutterfire_samples/widgets/transaction_details.dart';


class myvehicle extends StatefulWidget {
  const myvehicle({Key key}) : super(key: key);

  @override
  _myvehicleState createState() => _myvehicleState();
}

class _myvehicleState extends State<myvehicle> {

  List _cards ;
  Map _data;
  double _width = 0;

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/data.json").then((d) {
      _cards = json.decode(d);
      setState(() => _data = _cards[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // initState();
    if (_cards == null) return Container(
      child: Text("Empty", style: TextStyle(color: Colors.white),),
    );
    if (_width <= 0) _width = MediaQuery.of(context).size.width - 40.0;
    return Scaffold(
      backgroundColor: CustomColors.firebaseNavy,
      appBar: AppBar(
        title: getAppBarUI(),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleScreen()),);
            },
            child: Icon(Icons.add),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
                "My Vehicles",
                style: TextStyle(color: Colors.white,fontSize: 25)
            ),
          ),
          SizedBox(height: 20.0),
          CardSelector(
              cards: _cards.map((context) => CardPage(context)).toList(),
              mainCardWidth: _width,
              mainCardHeight: _width * 0.63,
              mainCardPadding: 24.0,//-16.0
              onChanged: (i) => setState(() => _data = _cards[i])),
          SizedBox(height: 10.0),
          Expanded(child: AmountPage(_data)),
        ],
      ),
    );
  }
}
