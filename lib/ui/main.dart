import 'package:flutter/material.dart';
import 'package:hello_word/model/model_single_get.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Main> {
  Future<User> userfuture;
  @override
  void initState() {
    User.isConnected().then((internet) {
      if (internet) {
        setState(() {
          userfuture = User.connectToApi("11");
        });
      } else {
        Text("no connection");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: (Text("Api Single User")),
        ),
        body: Container(
          child: FutureBuilder<User>(
            future: userfuture,
            builder: (context, snapshot) {
              var connection = snapshot.connectionState;
              switch (connection) {
                case ConnectionState.active:
                  {
                    break;
                  }
                case ConnectionState.waiting:
                  {
                    return loadingView();
                  }
                  break;
                case ConnectionState.done:
                  {
                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        return message(snapshot.data.name);
                      } else {
                        return message("no Data");
                      }
                    } else if (snapshot.hasError) {
                      return message("error data");
                    } else {
                      return message("something went wrong");
                    }
                  }
                  break;
                case ConnectionState.none:
                  {}
                
              }
                return loadingView();
            },
          ),
        ),
      ),
    );
  }

  Center loadingView() {
    return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                );
  }

  Center message(String message) {
    return Center(
      child: Text(message),
    );
  }
}
