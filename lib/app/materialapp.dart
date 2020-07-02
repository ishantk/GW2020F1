import 'package:flutter/material.dart';

class MyMaterialApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Material App",
        home: YourHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyMaterialHome"),
      ),
      body: Center(
        // For attributes refer documentation: https://api.flutter.dev/flutter/widgets/Center-class.html
        child: Text("Search the candle rather than cursing the darkness"),
      ),
    );
  }
}

class YourHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container( // A Layout
      decoration: BoxDecoration(
        color: Colors.black87
      ),
      child: Center(
        child:Text(
        "Be Exceptional",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.deepPurple
        ),
       ),
      )
    );
  }
}