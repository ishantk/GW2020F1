import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "My Stack App",

      home: Scaffold(
        appBar: AppBar(
          title: Text("My Stack App"),
        ),
        body: Center(
          child: getStackWidget(),
        ),
      ),
    );
  }
}

Widget getStackWidget(){
  return Card(
      child: Stack(
      alignment: Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/john.jpeg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          child: Text(
            "John Cena",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),
          ),
        )
      ],
    )
  );
}