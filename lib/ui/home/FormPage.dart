import 'package:flutter/material.dart';

void main() => runApp(FormPage());

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

//http://www.codeplayon.com/2020/02/simple-flutter-login-screen-ui-example/
class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Form Page")
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(

        ),
      ),
    );
  }
}
