import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';

class AddRepairForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  // final FocusNode vehicletype;
  final FocusNode kmFocusNode;
  final FocusNode repairamtFocusNode;
  final FocusNode locationFocusNode;
  final FocusNode notesFocusNode;

  const AddRepairForm({
    required this.titleFocusNode,
    // required this.vehicletype,
    required this.kmFocusNode,
    required this.repairamtFocusNode,
    required this.locationFocusNode,
    required this.notesFocusNode,
  });

  @override
  _AddRepairFormState createState() => _AddRepairFormState();
}

class _AddRepairFormState extends State<AddRepairForm> {
  final _AddRepairFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;
  bool isSwitched = true;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _fuelamtController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddRepairFormKey,
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
                  'Add Details For',
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
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Add Details For',
                  hint: 'your Vehicle Name',
                ),
                SizedBox(height: 24.0),
                Text(
                  'Vehicle Part Type?',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text('Old'),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeTrackColor: Colors.orange[200],
                      activeColor: Colors.orange,
                    ),
                    Text('New'),
                  ]
                ),
                SizedBox(height: 24.0),
                Text(
                  'Enter KM',
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
                  controller: _kmController,
                  focusNode: widget.kmFocusNode,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Enter KM',
                  hint: 'Enter KM',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Repair Amount',
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
                  controller: _fuelamtController,
                  focusNode: widget.repairamtFocusNode,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Repair Amount',
                  hint: 'Enter Repair Amount',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Location',
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
                  controller: _locationController,
                  focusNode: widget.locationFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Location',
                  hint: 'Enter your Location',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Vehicle Part Name / Notes',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _notesController,
                  focusNode: widget.notesFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  /*validator: (value) => Validator.validateField(
                    value: value,
                  ),*/
                  label: 'Notes',
                  hint: 'Notes', validator: (String value) {  },
                ),
                SizedBox(height: 24.0),

              ],
            ),
          ),
          if (_isProcessing) Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                CustomColors.firebaseOrange,
              ),
            ),
          ) else Container(
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

                if (_AddRepairFormKey.currentState!.validate()) {
                  setState(() {
                    _isProcessing = true;
                  });

                  await Database.addItemrepair(

                    vehiclename: _titleController.text,
                    parttype: isSwitched,
                    km: _kmController.text,
                    expenseamt: _fuelamtController.text,
                    location: _locationController.text,
                    partnamenotes: _notesController.text,

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
                  'ADD NOW',
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
