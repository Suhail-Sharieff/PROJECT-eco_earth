import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg, Color backgroundColor) {
//the below method came from flutter-toast library we got from pub
  Fluttertoast.showToast(

      msg: msg,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}
