import 'package:flutter/material.dart';

// MaterialApp is the App which must have at least 1 home page where it would redirect in beginning
class MyMaterialApp extends StatelessWidget{

//  String appTitle;
//
//  MyMaterialApp({this.appTitle});

  @override
  Widget build(BuildContext context) {
   // BuildContext shall be the Parent of the Widget which will be built here

//    const mRef = MaterialApp(title: 'MyMaterialApp',);
//    return mRef;

    return MaterialApp(
      title: 'MyMaterialApp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome Home'),
        ),
      ),
      theme: ThemeData(
        primaryColor: Colors.amber,
        brightness: Brightness.light
      ),
    );

  }


}