//@dart=2.8
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/utils/database.dart';

class Expenses extends StatefulWidget {
  @override
  ESTATE createState() => ESTATE();
}

class ESTATE extends State<Expenses> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('notes')
            .doc(Database.userUid)
            .collection("Transaction")
            .snapshots(),
        builder: (context, snapshot) {
          return ListView(
              children: snapshot.data.documents.map((document) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 6,
                child: Text("Title: " + document['vehiclename']),
              ),
            );
          }).toList(),
              );
        });
  }
}