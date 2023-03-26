import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> customToast(String msg, bool isErr) async {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: isErr ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}
