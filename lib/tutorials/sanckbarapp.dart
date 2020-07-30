import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// MaterialApp is the App which must have at least 1 home page where it would redirect in beginning
class MyMaterialSnackBarApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'MyMaterialApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome Home'),
        ),
        body: SnackBarWidget(),
      ),
      theme: ThemeData(
          primaryColor: Colors.amber,
          brightness: Brightness.light
      ),
    );

  }
}

class SnackBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Click Me :)"),
        onPressed: (){ // Anonymous Function -> No Name to the Function
          final sBar = SnackBar(
            content: Text("This is Awesome :)"),
            action: SnackBarAction(
              label: "Exit",
              onPressed: (){
                SystemNavigator.pop(); // Explore What Happens
              },
            ),
          );
          Scaffold.of(context).showSnackBar(sBar);
        },
      ),
    );
  }
}