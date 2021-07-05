import 'package:flutter/material.dart';
import 'package:flutterfire_samples/model/firebase_picture_uploader_widget.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

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

  final TextEditingController _docNameFocusNode = TextEditingController();

  List<UploadJob> _profilePictures = [];

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
          ),
          _isProcessing
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                CustomColors.firebaseOrange,
              ),
            ),
          )
              : Container(
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
