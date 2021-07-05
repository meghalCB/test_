//@dart=2.7

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_samples/model/firebase_picture_uploader_widget.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key key}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  List<UploadJob> _profilePictures = [];

  @override
  Widget build(BuildContext context) {
    final profilePictureTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Upload Your Documents',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 15.0,
              )),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          PictureUploadWidget(
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
          ),
        ],
      ),
    );

    return new Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 50),
          child: Column(children: <Widget>[profilePictureTile])),
    );
  }

  void profilePictureCallback(
      {List<UploadJob> uploadJobs, bool pictureUploadProcessing}) {
    _profilePictures = uploadJobs;
  }
}
