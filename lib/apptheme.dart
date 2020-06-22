import 'package:flutter/material.dart';

// MaterialApp is the App which must have at least 1 home page where it would redirect in beginning
class MyMaterialAppTheme extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final appName = 'MyMaterialApp';

    return MaterialApp(
      title: appName,
      home: MyMaterialHomePage(title: appName),
      theme: ThemeData(
          primaryColor: Colors.amber,
          brightness: Brightness.light,
          accentColor: Colors.amber[300],
          fontFamily: 'Georgia',
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Hind'
              )
          )

      ),
    );
  }
}

class MyMaterialHomePage extends StatelessWidget{

  // Attribute of MyMaterialHomePage
  String title;

  // Key is an API which is a unique ID Associated to the Widget which we will be building
  // If we create constructor we must use the super keyword to pass the data to the Parent Class
  MyMaterialHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: Text("Work Hard, Get Luckier !!",
            style: Theme.of(context).textTheme.headline1,),
        ),
      ),
    );
  }

}