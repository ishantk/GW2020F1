import 'package:flutter/material.dart';

// Inheritance | IS-A Relation
// HomePage is a StatelessWidget
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    /*
    //Text quote = new Text("Be Exceptional");
    var quote = Text("Be Exceptional"); // Text Label
    var center = Center(child: quote);  // To put something in Center

    // Scaffold is a Layout Design which follow MaterialDesign
    // Scaffold shall provide the APIs (Drawers, BottomSheets, SnackBars etc..)
    var scaffold = Scaffold(body: center);
    return scaffold;
    */

    return Scaffold(
      body: Center(
        child: Text(
            "Be Exceptional. Work Hard"
        ),
      ),
    );

  }

}