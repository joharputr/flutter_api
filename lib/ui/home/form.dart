import 'package:flutter/material.dart';
import 'package:hello_word/ui/home/FormPage.dart';
void main() => runApp(Form());
class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: FormPage(),
    );
  }
}
