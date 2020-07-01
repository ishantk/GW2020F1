import 'package:flutter/material.dart';
import 'package:gw2020f1/login.dart';
import 'package:gw2020f1/listview.dart';

class TabApp extends StatelessWidget{

  final String appTitle = "My Tab App";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
            primaryColor: Colors.teal,
            brightness: Brightness.light
        ),
      home: TabHomePage(appTitle: appTitle)
    );

  }
}

class TabHomePage extends StatelessWidget{

  String appTitle;

  TabHomePage({Key key, @required this.appTitle}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.music_video),
                text: "Music",
              ),
              Tab(
                icon: Icon(Icons.play_arrow),
                text: "Player",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LoginPage(),
            HomeBody(),
            Center(
              child: Text("Music Player"),
            )
          ],
        ),
      ),
    );
  }
}

// Assignment : Replicate the UI of WhatsApp on Android