import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/model/firebase_picture_uploader_widget.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/screens/edit_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';



Future<List<Map<String, dynamic>>> _loadImages() async {
  List<Map<String, dynamic>> files = [];
  FirebaseStorage storage = FirebaseStorage.instance;

  final ListResult result = await storage.ref(Database.userUid).list();
  final List<Reference> allFiles = result.items;

  await new Future.delayed(new Duration(seconds: 5));

  await Future.forEach<Reference>(allFiles, (file) async {
    final String fileUrl = await file.getDownloadURL();
    final FullMetadata fileMeta = await file.getMetadata();
    files.add({
      "url": fileUrl,
      "path": file.fullPath,
      "uploaded_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
      "description":
      fileMeta.customMetadata?['description'] ?? 'No description'
    });
  });

  return files;
}

class ItemDocumentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Expanded(
        child: FutureBuilder(
          future: _loadImages(),
          builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> image =
                  snapshot.data![index];

                  // print(Image.network(image['url']));

                  return Card(
                    color: Colors.white12,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.network(image['url']),
                      title: Text(image['uploaded_by']),
                      subtitle: Text(image['description']),
                      /*    trailing: IconButton(
                                    onPressed: () => _delete(image['path']),
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
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
          },
        ),
      ),
    );
  }
}



/*    return StreamBuilder<QuerySnapshot>(
      stream: Database.readDocumentItems(),
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
              String docName = noteInfo['docName'];
              String imagePath = noteInfo['imagePath'];


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
                        Text('DOCUMENT NAME', style: TextStyle(fontSize: 21,),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            docName, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800,),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 25,),

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
    );*/