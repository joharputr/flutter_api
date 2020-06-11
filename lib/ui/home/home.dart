import 'package:flutter/material.dart';
import 'package:hello_word/ui/home/FormInsertData.dart';
import 'package:hello_word/ui/home/GetListActivity.dart';
import 'package:hello_word/ui/main.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

List tabs = [new FormInsertData(),new Main(), new GetListActivity()];

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarms), title: Text("alarm")),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), title: Text("List"))
          ],
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
