import 'package:flutter/material.dart';
import 'package:flutterfire_samples/res/custom_colors.dart';
import 'package:flutterfire_samples/widgets/add_item_form.dart';
import 'package:flutterfire_samples/widgets/app_bar_title.dart';
import 'package:flutterfire_samples/widgets/pucinsure_add_form.dart';

class pucinsureScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _expdateFocusNode = FocusNode();
  final FocusNode _kmFocusNode = FocusNode();
  final FocusNode _pucinsureamtFocusNode = FocusNode();
  final FocusNode _companynameFocusNode = FocusNode();
  final FocusNode _notesFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _pucinsureamtFocusNode.unfocus();
        _notesFocusNode.unfocus();
        _expdateFocusNode.unfocus();

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
              child: pucinsureItemForm(
                titleFocusNode: _titleFocusNode,
                pucinsureamtFocusNode: _pucinsureamtFocusNode,
                notesFocusNode: _notesFocusNode,
                kmFocusNode: _kmFocusNode,
                companynameFocusNode: _companynameFocusNode,
                expdataFocusNode: _expdateFocusNode,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
