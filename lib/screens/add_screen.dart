import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/add_item_form.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';

class AddScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _kmFocusNode = FocusNode();
  final FocusNode _fuelamtFocusNode = FocusNode();
  final FocusNode _fuelplFocusNode = FocusNode();
  final FocusNode _locationFocusNode = FocusNode();
  final FocusNode _notesFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _fuelamtFocusNode.unfocus();
        _fuelplFocusNode.unfocus();
        _locationFocusNode.unfocus();
        _notesFocusNode.unfocus();
        _descriptionFocusNode.unfocus();

      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.firebaseNavy,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: CustomColors.firebaseNavy,
          title: getAppBarUI('Add Fuel'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: SingleChildScrollView(
              child: AddItemForm(
                titleFocusNode: _titleFocusNode,
                descriptionFocusNode: _descriptionFocusNode,
                fuelamtFocusNode: _fuelamtFocusNode,
                fuelplFocusNode: _fuelplFocusNode,
                locationFocusNode: _locationFocusNode,
                notesFocusNode: _notesFocusNode,
                kmFocusNode: _kmFocusNode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
