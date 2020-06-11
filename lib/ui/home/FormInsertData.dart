import 'package:flutter/material.dart';
import 'package:hello_word/ui/home/FormPage.dart';

void main() => runApp(FormInsertData());

class FormInsertData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       
        theme: ThemeData(primarySwatch: Colors.blue), home: FormPage());
  }
}