import 'package:flutter/material.dart';

// function: dart functional programming
// its not like function can only be created in class
void switchUI(BuildContext context){

  MaterialPageRoute route = MaterialPageRoute(
    builder: (BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text(MyAppBarApp.title),
        ),
        body: Center(
          child: Text("This is Second UI Page", style: TextStyle(fontSize: 24.0, color: Colors.orange, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ),
      );
    }
  );

  Navigator.push(context, route);

}

// Global Variables for accessing anywhere
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(); // unique key object fpr scaffold
SnackBar snackBar = SnackBar(content: Text("This is a SnackBar"));


class MyAppBarApp extends StatelessWidget{

  // static is property of class and not of object
  // Hence, without creating object we can access it with class name
  static const String title = "My AppBar App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: AppBarWidget(),
    );
  }
}

class AppBarWidget extends StatefulWidget{

  AppBarWidget({Key key}) : super(key: key);

  @override
  AppBarWidgetState createState() => AppBarWidgetState();
}

class AppBarWidgetState extends State<AppBarWidget>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(MyAppBarApp.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Info',
            onPressed: (){
              scaffoldKey.currentState.showSnackBar(snackBar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.open_in_new),
            tooltip: 'Open',
            onPressed: (){
              switchUI(context);
            },
          ),
        ],
      ),
      body: (
        Center(
          child: Text("This is First UI Page", style: TextStyle(fontSize: 24.0, color: Colors.green, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
        )
      ),
    );
  }

}