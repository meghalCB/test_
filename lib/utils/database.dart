import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userUid;

  static String? docId;
  static String? userName;

  static Future<void> addItem({
    String expensetype = 'Fuel',
    required String vehiclename,
    required String km,
    required String expenseamt,
    required String fuelpl,
    required String location,
    required String notes,
    required String description,

  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('Transaction').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "expenseamt": int.parse(expenseamt),
      "fuelpl": fuelpl,
      "location": location,
      "notes": notes,
      "description": description,
      "expensetype": expensetype,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Fuel added to the database"))
        .catchError((e) => print(e));
  }


  static Future<void> addItemrepair({
    String expensetype = 'Repair',
    required String vehiclename,
    required bool parttype,
    required String km,
    required String expenseamt,
    required String location,
    required String partnamenotes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('Transaction').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "parttype": parttype,
      "km": km,
      "expenseamt": int.parse(expenseamt),
      "location": location,
      "partnamenotes": partnamenotes,
      "expensetype": expensetype,
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
    required String expenseamt,
    required String location,
    required String notes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('Transaction').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "expenseamt": int.parse(expenseamt),
      "location": location,
      "partnamenotes": notes,
      "expensetype": expensetype,
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
    required String expenseamt,
    required String companyname,
    required String expdate,
    required String notes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('Transaction').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "expdate": expdate,
      "expenseamt": int.parse(expenseamt),
      "companyname": companyname,
      "partnamenotes": notes,
      "expensetype": expensetype,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Puc / Insurance items added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> addTyreCareItem({
    String expensetype = 'Tyre Care',
    required String vehiclename,
    required String selecttype,
    required String km,
    required String expenseamt,
    required String location,
    required String notes,

  }) async {
    DocumentReference documentReferencer =
    _mainCollection.doc(userUid).collection('Transaction').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "expenseamt": int.parse(expenseamt),
      "location": location,
      "partnamenotes": notes,
      "expensetype": expensetype,
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
    "km": int.parse(km),
    "puc": puc,
    "insurance": insurance,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Vehicle(s) added to the database"))
        .catchError((e) => print(e));
  }



  static Future<void> updateItem({
    required String vehiclename,
    required String km,
    required String expenseamt,
    required String fuelpl,
    required String location,
    required String notes,
    required String description,
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('items').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "vehiclename": vehiclename,
      "km": km,
      "expenseamt": int.parse(expenseamt),
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

  static Stream<QuerySnapshot> readTransactions() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('Transaction');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> getusername() {
    CollectionReference notesItemCollection =
    _mainCollection.doc(userUid).collection('items');

    return notesItemCollection.snapshots();
  }


  static Stream<QuerySnapshot> readVehicleItems() {
    CollectionReference notesVehicleItemCollection =
    _mainCollection.doc(userUid).collection('MY Vehicle');

    // FirebaseFirestore.instance.collection('products').where('productType', whereIn: <String>['product1', 'product2']);
    
    return notesVehicleItemCollection.snapshots();
  }

  static Stream<QuerySnapshot> readTotal() {
    Query notesVehicleItemCollection =
    _mainCollection.doc(userUid).collection('Transaction').where('productType', whereIn: <String>['product1', 'product2']);

    // FirebaseFirestore.instance.collection('products').where('productType', whereIn: <String>['product1', 'product2']);

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
