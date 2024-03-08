import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Showtoaster {
  classtoaster(txt, Color color) {
    Fluttertoast.showToast(
        msg: txt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
