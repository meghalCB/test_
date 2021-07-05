import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userUid;

  static String? docId;

  static Future<void> addItem({
    required String title,
    required String km,
    required String fuelamt,
    required String fuelpl,
    required String location,
    required String notes,
    required String description,

  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "km": km,
      "fuelamt": fuelamt,
      "fuelpl": fuelpl,
      "location": location,
      "notes": notes,
      "description": description,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }


  static Future<void> addItemrepair({
    String expensetype = 'Repair',
    required String vehiclename,
    required bool parttype,
    required String km,
    required String repairamt,
    required String location,
    required String partnamenotes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection(expensetype).doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "parttype": parttype,
      "km": km,
      "repairamt": repairamt,
      "location": location,
      "partnamenotes": partnamenotes,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Repair items added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addItemservice({
    String expensetype = 'Service',
    required String vehiclename,
    required String km,
    required String serviceamt,
    required String location,
    required String notes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection(expensetype).doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "repairamt": serviceamt,
      "location": location,
      "partnamenotes": notes,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Service items added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addItempucinsure({
    String expensetype = 'puc Insurance',
    required String vehiclename,
    required String selecttype,
    required String km,
    required String pucinsureamt,
    required String companyname,
    required String expdate,
    required String notes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection(expensetype).doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "expdate": expdate,
      "pucinsureamt": pucinsureamt,
      "companyname": companyname,
      "partnamenotes": notes,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Puc / Insurance items added to the database"))
        .catchError((e) => print(e));
  }


  static Future<void> addvehicle({
    required String vehicletype,
    required String brandname,
    required String modelname,
    required String vehiclenum,
    required String km,
    required String puc,
    required String insurance,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('MY Vehicle').doc();

    Map<String, dynamic> data = <String, dynamic>{
    "vehicletype": vehicletype,
    "brandname": brandname,
    "modelname": modelname,
    "vehiclenum": vehiclenum,
    "km": km,
    "puc": puc,
    "insurance": insurance,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Vehicle(s) added to the database"))
        .catchError((e) => print(e));
  }



  static Future<void> updateItem({
    required String title,
    required String km,
    required String fuelamt,
    required String fuelpl,
    required String location,
    required String notes,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "km": km,
      "fuelamt": fuelamt,
      "fuelpl": fuelpl,
      "location": location,
      "notes": notes,
      "description": description,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> getItem({
    /*required String title,
    required String km,
    required String fuelamt,
    required String fuelpl,
    required String location,
    required String notes,
    required String description,*/
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      /*"title": title,
      "km": km,
      "fuelamt": fuelamt,
      "fuelpl": fuelpl,
      "location": location,
      "notes": notes,
      "description": description,*/
    };

    /*await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));*/
  }


  static Future<void> addDocument({
    required String docName,
    required String imagePath,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('MY Document').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "docName": docName,
      "imagePath": imagePath,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Document(s) added to the database"))
        .catchError((e) => print(e));
  }


  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readVehicleItems() {
    CollectionReference notesVehicleItemCollection =
    _mainCollection.doc(userUid).collection('MY Vehicle');

    return notesVehicleItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readDocumentItems() {
    CollectionReference notesDocumentItemCollection =
    _mainCollection.doc(userUid).collection('MY Document');

    return notesDocumentItemCollection.snapshots();
  }

/*  static Stream<QuerySnapshot> getItem() {
    DocumentReference docReferencer =
    _mainCollection.doc(userUid).collection('items').doc('1smsSEWqux6vMEU7AgZg');

    return docReferencer;
  }*/

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
