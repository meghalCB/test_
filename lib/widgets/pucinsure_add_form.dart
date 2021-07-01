import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';

class pucinsureItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode kmFocusNode;
  final FocusNode pucinsureamtFocusNode;
  final FocusNode companynameFocusNode;
  final FocusNode expdataFocusNode;
  final FocusNode notesFocusNode;

  const pucinsureItemForm({
    required this.titleFocusNode,
    required this.kmFocusNode,
    required this.pucinsureamtFocusNode,
    required this.companynameFocusNode,
    required this.notesFocusNode,
    required this.expdataFocusNode,
  });

  @override
  _pucinsureItemFormState createState() => _pucinsureItemFormState();
}

class _pucinsureItemFormState extends State<pucinsureItemForm> {
  final _pucinsureItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _pucinsureamtController = TextEditingController();
  final TextEditingController _companynameController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _expdataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _pucinsureItemFormKey,
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
                  hint: 'Enter Add Details For',
                ),
                SizedBox(height: 24.0),


                /*Text(
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
                SizedBox(height: 24.0),*/

                Text(
                  'PUC / Insurance Amount',
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
                  controller: _pucinsureamtController,
                  focusNode: widget.pucinsureamtFocusNode,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'PUC / Insurance Amount',
                  hint: 'Enter PUC / Insurance Amount',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Company Name',
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
                  controller: _companynameController,
                  focusNode: widget.companynameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Company Name',
                  hint: 'Enter Company Name',
                ),
                SizedBox(height: 24.0),


                Text(
                  'Expiry Date',
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
                  controller: _expdataController,
                  focusNode: widget.expdataFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Expiry Date',
                  hint: 'Enter Expiry Date',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Notes',
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
                  hint: 'Notes',
                  validator: (String value) {  },
                ),
                SizedBox(height: 24.0),

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

                if (_pucinsureItemFormKey.currentState!.validate()) {
                  setState(() {
                    _isProcessing = true;
                  });

                  await Database.addItempucinsure(
                    vehiclename: _titleController.text,
                    km: _kmController.text,
                    selecttype: 'puc',
                    pucinsureamt: _pucinsureamtController.text,
                    companyname: _companynameController.text,
                    notes: _notesController.text,

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
