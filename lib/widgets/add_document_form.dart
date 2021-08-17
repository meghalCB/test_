import 'package:flutter/material.dart';
import 'package:flutterfire_samples/model/firebase_picture_uploader_widget.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';


import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';

import 'custom_form_field.dart';


enum SingingCharacter { a, b, c }

class AddDocumentForm extends StatefulWidget {
  final FocusNode docNameFocusNode;

  const AddDocumentForm({Key? key,
    required this.docNameFocusNode,
  });

  @override
  _AddDocumentFormState createState() => _AddDocumentFormState();
}

class _AddDocumentFormState extends State<AddDocumentForm> {
  final _AddDocumentFormKey = GlobalKey<FormState>();
  SingingCharacter? _character;
  bool _isProcessing = false;
  File? _imageFile ;

  final TextEditingController _docNameFocusNode = TextEditingController();

  List<UploadJob> _profilePictures = [];
  FirebaseStorage storage = FirebaseStorage.instance;



  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allFiles = result.items;

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


  Future<void> _upload(String inputSource) async {
    final picker = ImagePicker();
    PickedFile? pickedImage;
    try {
      pickedImage = await picker.getImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);





      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      setState(() {
        _imageFile = imageFile;
      });


      print('imageFile' + imageFile.toString());

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(Database.userUid).child(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'uploaded_by': _docNameFocusNode.text,
              'description': ''
            }));

        // print(imageFile);

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddDocumentFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              bottom: 24.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.0),

                Text(
                  'Document Name',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),

                CustomFormField(
                  isLabelEnabled: false,
                  controller: _docNameFocusNode,
                  focusNode: widget.docNameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Document Name',
                  hint: 'Enter Document Name',
                ),
                SizedBox(height: 24.0),

            _imageFile == null ?
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                        onPressed: () => _upload('camera'),
                        icon: Icon(Icons.camera),
                        label: Text('camera')),
                    ElevatedButton.icon(
                        onPressed: () => _upload('gallery'),
                        icon: Icon(Icons.library_add),
                        label: Text('Gallery')),
                  ],
                )
                 :
                Container(
                  child: Image.file(
                    _imageFile!,
                    fit: BoxFit.cover,
                  ),
                )

                /*Expanded(
                  child: FutureBuilder(
                    future: _loadImages(),
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> image =
                            snapshot.data![index];

                            print(Image.network(image['url']));

                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                dense: false,
                                leading: Image.network(image['url']),
                                title: Text(image['uploaded_by']),
                                subtitle: Text(image['description']),
                                *//*trailing: IconButton(
                                  onPressed: () => _delete(image['path']),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),*//*
                              ),
                            );
                          },
                        );
                      }

                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),*/


                /*PictureUploadWidget(
                  initialImages: _profilePictures,
                  onPicturesChange: profilePictureCallback,
                  buttonStyle: PictureUploadButtonStyle(),
                  buttonText: 'Upload Documents',
                  localization: PictureUploadLocalization(),
                  settings: PictureUploadSettings(
                    // customDeleteFunction: ProfileController.deleteProfilePicture,
                    // customUploadFunction: RecipeController.uploadRecipePicture,
                      imageSource: ImageSourceExtended.askUser,
                      minImageCount: 0,
                      maxImageCount: 5,
                      imageManipulationSettings: const ImageManipulationSettings(
                          enableCropping: false, compressQuality: 75)),
                  enabled: true,
                ),*/
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                CustomColors.firebaseOrange,
              ),
            ),
          ): Container(
            width: double.maxFinite,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  CustomColors.firebaseOrange,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () async {

                if (_AddDocumentFormKey.currentState!.validate()) {
                  setState(() {
                    _isProcessing = true;
                  });

                  await Database.addDocument(
                    imagePath: '',
                    docName: _docNameFocusNode.text
                  );

                  setState(() {
                    _isProcessing = false;
                  });

                  Navigator.of(context).pop();
                }
              },
              child: Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  'Uploaod Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.firebaseGrey,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void profilePictureCallback(
      {List<UploadJob>? uploadJobs, bool? pictureUploadProcessing}) {
    _profilePictures = uploadJobs!;
  }

}
/*
Widget _setImageView() {
  if (imageFile != null) {
    return Image.file(imageFile, width: 500, height: 500);
  } else {
    return Text("Please select an image");
  }
}*/
