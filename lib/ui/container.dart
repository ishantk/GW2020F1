import 'package:flutter/material.dart';

class ContainerApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Container App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container App"),
      ),
      body: Center(
        child: getImages(context),
      ),
    );
  }
}

/*Widget getImages(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      color: Colors.deepPurple
    ),
    child: Column(
      children: [
        getDecoratedImage(context, "rock"),
        getDecoratedImage(context, "john")
      ],
    ),
  );
}*/

Widget getImages(BuildContext context) => Container(
    decoration: BoxDecoration(
        color: Colors.deepPurple
    ),
    //child: Column(
    child: Row(
      children: [
        getDecoratedImage(context, "rock"),
        getDecoratedImage(context, "john")
      ],
    ),
  );

Widget getDecoratedImage(BuildContext context, String imageName){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 12, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      margin: EdgeInsets.all(4),
      child: Image.asset("assets/$imageName.jpeg"),
    ),
  );
}

// Assignment: Explore how different sized images can be placed as the same image size