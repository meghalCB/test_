import 'package:flutter/material.dart';
import 'package:flutterfire_samples/Dropdown/customdropdown.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';
import 'mytransaction_db.dart';

class AddtyrecareForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode kmFocusNode;
  final FocusNode fuelamtFocusNode;
  final FocusNode fuelplFocusNode;
  final FocusNode locationFocusNode;
  final FocusNode notesFocusNode;
  final FocusNode descriptionFocusNode;

  const AddtyrecareForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required this.kmFocusNode,
    required this.fuelamtFocusNode,
    required this.fuelplFocusNode,
    required this.locationFocusNode,
    required this.notesFocusNode,
  });

  @override
  _AddtyrecareFormState createState() => _AddtyrecareFormState();
}

class _AddtyrecareFormState extends State<AddtyrecareForm> {
  final _AddtyrecareFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _fuelamtController = TextEditingController();
  final TextEditingController _fuelplController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddtyrecareFormKey,
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
                ItemDropdown(),
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
                widget.titleFocusNode.unfocus();
                widget.descriptionFocusNode.unfocus();

                if (_AddtyrecareFormKey.currentState!.validate()) {
                  setState(() {
                    _isProcessing = true;
                  });

                  await Database.addItem(
                    title: _titleController.text,
                    km: _kmController.text,
                    fuelamt: _fuelamtController.text,
                    fuelpl: _fuelplController.text,
                    location: _locationController.text,
                    notes: _notesController.text,
                    description: _descriptionController.text,

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
                  'SUBMIT',
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
}
