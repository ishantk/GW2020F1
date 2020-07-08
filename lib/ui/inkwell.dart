import 'package:flutter/material.dart';
import 'package:gw2020f1/ui/json-parsing.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ripple Effect",
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture App"),
      ),
      body: Center(
        child: InkWell(
          child: Container(
            padding: EdgeInsets.all(16),
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
          onTap: (){
            Navigator.push(   // startActivity()
                context,
                MaterialPageRoute( // Intent
                    builder: (context) => NewsPage(url: "https://google.co.in")
                )
            );
          },
        ),
      ),
    );
  }
}
     