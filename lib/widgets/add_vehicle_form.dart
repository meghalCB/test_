import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/utils/database.dart';
import 'package:flutterfire_samples/utils/validator.dart';

import 'custom_form_field.dart';


enum SingingCharacter { a, b, c }

class AddVehicleForm extends StatefulWidget {
  // final FocusNode vehicletypeFocusNode;
  final FocusNode brandnameFocusNode;
  final FocusNode modelnameFocusNode;
  final FocusNode vehiclenumFocusNode;
  final FocusNode kmFocusNode;
  final FocusNode pucFocusNode;
  final FocusNode insuranceFocusNode;

  const AddVehicleForm({Key? key,
    // required this.vehicletypeFocusNode,
    required this.brandnameFocusNode,
    required this.modelnameFocusNode,
    required this.vehiclenumFocusNode,
    required this.kmFocusNode,
    required this.pucFocusNode,
    required this.insuranceFocusNode
  });

  @override
  _AddVehicleFormState createState() => _AddVehicleFormState();
}

class _AddVehicleFormState extends State<AddVehicleForm> {
  final _AddVehicleFormKey = GlobalKey<FormState>();
  SingingCharacter? _character;
  bool _isProcessing = false;

  final TextEditingController _vehicletypeFocusNode = TextEditingController();
  final TextEditingController _brandnameFocusNode = TextEditingController();
  final TextEditingController _modelnameFocusNode = TextEditingController();
  final TextEditingController _vehiclenumFocusNode = TextEditingController();
  final TextEditingController _kmFocusNode = TextEditingController();
  final TextEditingController _pucFocusNode = TextEditingController();
  final TextEditingController _insuranceFocusNode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _AddVehicleFormKey,
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
                  'Select Your Vehicle Type',
                  style: TextStyle(
                    color: CustomColors.firebaseGrey,
                    fontSize: 22.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  children: [
                    ListTile(
                      title: const Text('2 wheeler'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.a,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('3 wheeler'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.b,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('4 wheeler'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.c,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.0),
                Text(
                  'Brand Name',
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
                  controller: _brandnameFocusNode,
                  focusNode: widget.brandnameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Brand Name',
                  hint: 'Enter Brand Name',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Model Name',
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
                  controller: _modelnameFocusNode,
                  focusNode: widget.modelnameFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Model Name',
                  hint: 'Enter Model Name',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Vehicle Number',
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
                  controller: _vehiclenumFocusNode,
                  focusNode: widget.vehiclenumFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'Vehicle Number',
                  hint: 'Enter Vehicle Number',
                ),
                SizedBox(height: 24.0),

                Text(
                  'KiloMeter',
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
                  controller: _kmFocusNode,
                  focusNode: widget.kmFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (value) => Validator.validateField(
                    value: value,
                  ),
                  label: 'KiloMeter',
                  hint: 'Enter KiloMeter',
                ),
                SizedBox(height: 24.0),

                Text(
                  'PUC Number',
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
                  controller: _pucFocusNode,
                  focusNode: widget.pucFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (String value) {  },
                  label: 'PUC Number',
                  hint: 'Enter PUC Number',
                ),
                SizedBox(height: 24.0),

                Text(
                  'Insurance Number',
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
                  controller: _insuranceFocusNode,
                  focusNode: widget.insuranceFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.done,
                  validator: (String value) {  },
                  label: 'Insurance Number',
                  hint: 'Enter Insurance Number',
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

                if (_AddVehicleFormKey.currentState!.validate()) {
                  setState(() {
                    _isProcessing = true;
                  });

                  await Database.addvehicle(
                    vehicletype: _character.toString(),
                    brandname: _brandnameFocusNode.text,
                    insurance: _insuranceFocusNode.text,
                    km: _kmFocusNode.text,
                    modelname: _modelnameFocusNode.text,
                    puc: _pucFocusNode.text,
                    vehiclenum: _vehiclenumFocusNode.text,

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
