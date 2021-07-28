import 'package:flutter/material.dart';
import 'package:flutterfire_samples/Dropdown/customdropdown.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';


class AddItemForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode kmFocusNode;
  final FocusNode fuelamtFocusNode;
  final FocusNode fuelplFocusNode;
  final FocusNode locationFocusNode;
  final FocusNode notesFocusNode;
  final FocusNode descriptionFocusNode;

  const AddItemForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required this.kmFocusNode,
    required this.fuelamtFocusNode,
    required this.fuelplFocusNode,
    required this.locationFocusNode,
    required this.notesFocusNode,
  });

  @override
  _AddItemFormState createState() => _AddItemFormState();
}


class _AddItemFormState extends State<AddItemForm> {
  final _addItemFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _kmController = TextEditingController();
  final TextEditingController _fuelamtController = TextEditingController();
  final TextEditingController _fuelplController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  var selectedCurrency, selectedType;
  List<String> _accountType = <String>[
    'Savings',
    'Deposit',
    'Checking',
    'Brokerage'
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addItemFormKey,
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
                  'Add Fuel For',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                // MyHomePage(),
                /*CustomFormField(
                  isLabelEnabled: false,
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Add Fuel For',
                  hint: 'Enter Fuel For',
                ),*/
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
                  'Fuel Amount',
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
                  focusNode: widget.fuelamtFocusNode,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Fuel Amount',
                  hint: 'Enter Fuel Amount',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Fuel Amount Per Liter',
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
                  controller: _fuelplController,
                  focusNode: widget.fuelplFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Fuel Amount Per Liter',
                  hint: 'Enter Fuel Amount Per Liter',
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
                      widget.descriptionFocusNode.unfocus();

                      if (_addItemFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addItem(
                          vehiclename: _titleController.text,
                          km: _kmController.text,
                          expenseamt: _fuelamtController.text,
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
                        'ADD FUEL',
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