import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/edit_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';

class ItemVehicleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Database.readVehicleItems(),//readVehicleItems
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          int total = 0;
          var totalIncome = 0;
          snapshot.data!.docs.forEach((element) {
            total+=(element.data()?['km']) as int;
            // print(element.data());
          });
          totalIncome = total;
          print(totalIncome);

          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String brandname = noteInfo['brandname'];
              String modelname = noteInfo['modelname'];
              String vehiclenum = noteInfo['vehiclenum'];
              String km = noteInfo['km'];


              return Ink(
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
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('BRAND NAME / MODEL NAME', style: TextStyle(fontSize: 21,),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            brandname + ' / ' + modelname, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 25,),
                        Text('VEHICLE NUMBER', style: TextStyle(fontSize: 18,),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            vehiclenum, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 25,),
                        Text('KM', style: TextStyle(fontSize: 18,),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            km, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*trailing: Wrap(
                    children: <Widget>[
                      // Icon()
                      Text('\u{20B9} '+ vehiclenum)
                    ],
                  ),
                  subtitle: Text(
                    modelname,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),*/
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

    });
  }
}








        /*if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var noteInfo = snapshot.data!.docs[index].data()!;
              String docID = snapshot.data!.docs[index].id;
              String brandname = noteInfo['brandname'];
              String modelname = noteInfo['modelname'];
              String vehiclenum = noteInfo['vehiclenum'];
              String km = noteInfo['km'];
              // String description = noteInfo['description'];

              return Ink(
                decoration: BoxDecoration(
                  color: CustomColors.firebaseGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  *//*  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditScreen(
                          currentTitle: title,
                          // currentDescription: description,
                          documentId: docID,
                        ),
                      ),
                    ),*//*

                    title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BRAND NAME / MODEL NAME', style: TextStyle(fontSize: 21,),
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              brandname + '/' + modelname, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 25,),
                          Text('VEHICLE NUMBER', style: TextStyle(fontSize: 18,),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              vehiclenum, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 25,),
                          Text('KM', style: TextStyle(fontSize: 18,),
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              km, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    *//*trailing: Wrap(
                      children: <Widget>[
                        // Icon()
                        Icon(Icons.directions_car_outlined)
                      ],
                    ),*//*
                    *//*subtitle: Text(
                      modelname,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),*//*
                  ),
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
}*/
