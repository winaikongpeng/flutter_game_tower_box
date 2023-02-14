

import 'package:flutter/material.dart';

class DialogWidget {

   static Future<dynamic> showProgressDialog(BuildContext context , String text) {
    return showDialog(
context: context,
builder: (context) =>  Scaffold(
  backgroundColor: Colors.transparent,
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
     Center(child: Text(text , style: const TextStyle(fontSize: 35 , color: Colors.white),)),
    ],
  ),
)
);
  }

}