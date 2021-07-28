import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/edit_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';

class GetTotalExp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Database.readTransactions(),//readVehicleItems
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            int total = 0;
            var totalIncome = 0;
            snapshot.data!.docs.forEach((element) {
              total+=(element.data()?['expenseamt']) as int;
              // print(element.data());
            });
            totalIncome = total;
            print(totalIncome);

            return Container(
              width: double.infinity,
              height: 50,
              child: Text('\u20B9 $totalIncome',
                style: TextStyle(fontSize: 30),
              ),
            );
          }


          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                CustomColors.firebaseOrange,
              ),
            ),
          );

        });
  }
}

