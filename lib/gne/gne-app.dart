import 'package:flutter/material.dart';

// To create a widget, inherit from either StatelessWidget or StatefulWidget
class MyApp extends StatelessWidget{

  // build function will create a Widget and return back :)
  // the moment we create object of our class i.e. MyApp, build function will be executed automatically :)
  Widget build(BuildContext context){

    //MaterialApp app = new MaterialApp();
    //return app;

    // Readable format for Object:
    return MaterialApp(
        title:'GNE APP',
        //home: HomeUI()
        home: WhatsAppHomeUI()
    );
  }

}

// Stateless Widgets has No State
class HomeUI extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text("GNE APP")
      ),
      body: Center(
          child: Text("Welcome to Stateless Widget - GNE")
      ),
    );
  }

}

class WhatsAppHomeUI extends StatelessWidget{

  Widget build(BuildContext context){

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.phone),
                text: "Calls",
              ),
              Tab(
                icon: Icon(Icons.message),
                text: "Chats",
              ),
              Tab(
                icon: Icon(Icons.contacts),
                text: "Contacts",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WelcomeUI(),    // Stateless Widget
            HomeUI(),       // Stateful Widget
            Icon(Icons.contacts)  // Just an Icon
          ],
        ),
      )
    );
  }
}

// Stateful Widget Has-A State
// State for the widget is need so as to manage dynamic data
class WelcomeUI extends StatefulWidget{

  /*@override
  WelcomeUIState createState() {  // the moment we create object of WelcomeUI, createState function will be executed automatically
    return WelcomeUIState();
  }*/

  WelcomeUIState createState() => WelcomeUIState();
}

class WelcomeUIState extends State<WelcomeUI>{  // WelcomeUIState Object Construction executes the build function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("GNE APP")
      ),
      body: Center(
          child: Text("Welcome to Stateful Widget - GNE")
      ),
    );
  }
}



