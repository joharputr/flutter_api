import 'package:flutter/material.dart';
import 'package:hello_word/model/post_model.dart';

void main() => runApp(FormEditData());

class FormEditData extends StatefulWidget {
  @override
  _FormEditDataState createState() => _FormEditDataState();
}

class _FormEditDataState extends State<FormEditData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  PostModel postModel = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Edit Data'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Edit Data",
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
                    child: Text("Edit Data"),
                    onPressed: () {
                      PostModel.editData(2.toString(), nameController.text,
                              jobController.text)
                          .then((value) {
                        postModel = value;
                        setState(() {});
                      });
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                alignment: Alignment.center,
                child: Text((postModel == null)
                    ? "tidak ada "
                    : postModel.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
