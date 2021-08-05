import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/add_document_form.dart';
import 'package:flutterfire_samples/widgets/add_item_form.dart';
import 'package:flutterfire_samples/widgets/add_vehicle_form.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';

class AddDocumentScreen extends StatelessWidget {
  final FocusNode _docname = FocusNode();


  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

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
          title: getAppBarUI('My Documents'),
        ),
        body: SizedBox(
          height: screenHeight - keyboardHeight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: SingleChildScrollView(
                reverse: true,
                physics: ClampingScrollPhysics(),
                child: AddDocumentForm(
                  docNameFocusNode: _docname,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
