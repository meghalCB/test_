import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/edit_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';

class ItemDropdown extends StatelessWidget {

  var carMake, carMakeModel;
  var setDefaultMake = true, setDefaultMakeModel = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('MY Vehicle')
              .orderBy('brandname')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            // Safety check to ensure that snapshot contains data
            // without this safety check, StreamBuilder dirty state warnings will be thrown
            if (!snapshot.hasData) return Container();
            // Set this value for default,
            // setDefault will change if an item was selected
            // First item from the List will be displayed
            if (setDefaultMake) {
              carMake = snapshot.data!.docs[0].get('brandname');
              debugPrint('setDefault make: $carMake');
            }
            return DropdownButton(
              isExpanded: false,
              value: carMake,
              items: snapshot.data!.docs.map((value) {
                return DropdownMenuItem(
                  value: value.get('brandname'),
                  child: Text('${value.get('brandname')}'),
                );
              }).toList(),
              onChanged: (value) {
                debugPrint('selected onchange: $value');
                /*setState(
                      () {
                    debugPrint('make selected: $value');
                    // Selected value will be stored
                    carMake = value;
                    // Default dropdown value won't be displayed anymore
                    setDefaultMake = false;
                    // Set makeModel to true to display first car from list
                    setDefaultMakeModel = true;
                  },
                );*/
              },
            );
          },
        ),
      ),
    );
  }
}
