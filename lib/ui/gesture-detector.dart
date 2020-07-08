import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Gesture App",
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget{

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture App"),
      ),
      key:  scaffoldKey,
      //body: FutureBuilder<String>(
      body: Center(
        child: GestureDetector(
          child: Card(
            margin: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 6,),
                Text("Welcome to Home Page"),
                SizedBox(height: 10,),
                Text("Work Hard, Get Luckier"),
                SizedBox(height: 6,),
              ],
            ),
          ),
          onTap: () {
            final snackBar = SnackBar(content: Text("Card Tap Gesture Detected"),);
            scaffoldKey.currentState.showSnackBar(snackBar);
            print("Card Tap Gesture Detected");
          },
          onLongPress: () {
            final snackBar = SnackBar(content: Text("Card Long Press Gesture Detected"),);
            scaffoldKey.currentState.showSnackBar(snackBar);
            print("Card Long Press Gesture Detected");
          },
        ),
      )
    );
  }
}
