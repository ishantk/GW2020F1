import 'package:flutter/material.dart';

// MaterialApp is the App which must have at least 1 home page where it would redirect in beginning
class MyMaterialAppBar extends StatelessWidget{

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
          title: const Text('Welcome Home'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search...',
              onPressed: (){

              },
            ),
            IconButton(
              icon: const Icon(Icons.add_a_photo),
              tooltip: 'Click to Add Photo',
              onPressed: (){
                final sBar = SnackBar(
                  content: Text("This is Awesome :)"),
                  action: SnackBarAction(
                    label: "Exit",
                    onPressed: (){
                    },
                  ),
                );
                Scaffold.of(context).showSnackBar(sBar);
              },
            )
          ],
        ),
      ),
      theme: ThemeData(
          primaryColor: Colors.amber,
          brightness: Brightness.light
      ),
    );

  }


}