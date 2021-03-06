import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/edit_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';

class ItemTransactionList extends StatelessWidget {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readTransactions(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String vehiclename = noteInfo['vehiclename'];
              int expenseamt = noteInfo['expenseamt'];
              String expensetype = noteInfo['expensetype'];

              return Ink(
                decoration: BoxDecoration(
                  color: CustomColors.firebaseGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ExpansionTileCard(
                  // key: cardA,
                  title: Text(
                    vehiclename,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      // Icon()
                      Text('\u{20B9} '+ expenseamt.toString())
                    ],
                  ),
                  subtitle: Text(
                    expensetype,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          "FlutterDevs specializes in creating cost-effective and efficient applications with our perfectly crafted,"
                              " creative and leading-edge flutter app development solutions for customers all around the globe.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              CustomColors.firebaseOrange,
            ),
          ),
        );
      },
    );
  }
}
















/*return Ink(
                decoration: BoxDecoration(
                  color: CustomColors.firebaseGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  /*  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        currentTitle: title,
                        // currentDescription: description,
                        documentId: docID,
                      ),
                    ),
                  ),*/
                  title: Text(
                    vehiclename,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Wrap(
                    children: <Widget>[
                      // Icon()
                      Text('\u{20B9} '+ expenseamt.toString())
                    ],
                  ),
                  subtitle: Text(
                    expensetype,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );*/