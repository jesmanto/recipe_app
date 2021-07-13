import 'dart:ui';

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String s, Color color) {
  SnackBar snackBar = SnackBar(
    content: Text(s),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void closeKeyboard(BuildContext context){
  FocusScope.of(context).requestFocus(new FocusNode());
}
