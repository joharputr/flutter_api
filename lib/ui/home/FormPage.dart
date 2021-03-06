import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_word/model/post_model.dart';
import 'package:hello_word/ui/home/FormEditData.dart';

void main() => runApp(FormPage());

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

//http://www.codeplayon.com/2020/02/simple-flutter-login-screen-ui-example/
class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  PostModel postModel = null;

  void handleclickAppbar(String value) {
    switch (value) {
      case 'Edit Data':
        {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormEditData()),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Popup Menu Button'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: handleclickAppbar,
              itemBuilder: (BuildContext context) {
                return {'Edit Data'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Input Data",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: false,
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Name'),
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    controller: jobController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Job'),
                  )),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("Post Data"),
                    onPressed: () {
                      PostModel.connectToApi(
                              nameController.text, jobController.text)
                          .then((value) {
                        postModel = value;
                        setState(() {});
                      });
                      Fluttertoast.showToast(
                          msg: nameController.text,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.black,
                          fontSize: 16.0);
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                child: Text(
                    (postModel == null) ? "tidak ada data" : postModel.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
