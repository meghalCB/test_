import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/add_item_form.dart';
import 'package:flutterfire_samples/widgets/add_vehicle_form.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';

class VehicleScreen extends StatelessWidget {
  final FocusNode _vehicletype = FocusNode();
  final FocusNode _brandname = FocusNode();
  final FocusNode _modelname = FocusNode();
  final FocusNode _vehiclenum = FocusNode();
  final FocusNode _km = FocusNode();
  final FocusNode _puc = FocusNode();
  final FocusNode _insurance = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /*_titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _fuelamtFocusNode.unfocus();
        _fuelplFocusNode.unfocus();
        _locationFocusNode.unfocus();
        _notesFocusNode.unfocus();
        _descriptionFocusNode.unfocus();*/

      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: getAppBarUI(),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: SingleChildScrollView(
              child: AddVehicleForm(
                brandnameFocusNode: _brandname,
                modelnameFocusNode: _modelname,
                vehiclenumFocusNode: _vehiclenum,
                kmFocusNode: _km,
                pucFocusNode: _puc,
                insuranceFocusNode: _insurance,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
