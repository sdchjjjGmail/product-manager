import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showItemAddedMessage() {
  Fluttertoast.showToast(msg: "제품이 추가되었어요!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0
  );
}