//@dart=2.6
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp();
  runApp(MyApp());
}*/

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var carMake;
  var setDefaultMake = true, setDefaultMakeModel = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('carMake: $carMake');
    // debugPrint('carMakeModel: $carMakeModel');
    return SingleChildScrollView(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('notes').doc(Database.userUid).collection('MY Vehicle').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // Safety check to ensure that snapshot contains data
                  // without this safety check, StreamBuilder dirty state warnings will be thrown
                  if (!snapshot.hasData) return Container();
                  // Set this value for default,
                  // setDefault will change if an item was selected
                  // First item from the List will be displayed
                  if (setDefaultMake) {
                    carMake = snapshot.data.docs[0].get('brandname');
                    debugPrint('setDefault make: $carMake');
                  }

                  return Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: CustomColors.firebaseGrey.withOpacity(0.5)
                        )
                    ),

                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: DropdownButton(
                          dropdownColor: CustomColors.firebaseNavy.withOpacity(0.8),
                          isExpanded: false,
                          value: carMake,
                          style: TextStyle(color: Colors.white),
                          items: snapshot.data.docs.map((value) {
                            return DropdownMenuItem(
                              value: value.get('brandname'),
                              child: Text('${value.get('brandname')}',style:TextStyle(color:Colors.white,fontSize: 16)),
                            );
                          }).toList(),

                          onChanged: (value) {
                            debugPrint('selected onchange: $value');
                            setState(
                                  () {
                                debugPrint('make selected: $value');
                                // Selected value will be stored
                                carMake = value;
                                // Default dropdown value won't be displayed anymore
                                setDefaultMake = false;
                                // Set makeModel to true to display first car from list
                                setDefaultMakeModel = true;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
          );

  }
}















