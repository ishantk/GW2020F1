import 'package:flutter/material.dart';
import 'package:gw2020f1/login.dart';
import 'package:gw2020f1/listview.dart';

class NavigationDrawerApp extends StatelessWidget{

  final String appTitle = "My Nav Drawer App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
            primaryColor: Colors.amber,
            brightness: Brightness.light
        ),
        home: NavDrawerHomePage(appTitle: appTitle)
    );
  }
}

class NavDrawerHomePage extends StatelessWidget{

  String appTitle;

  NavDrawerHomePage({Key key, @required this.appTitle}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Text("My Home Page"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Header"),
              decoration: BoxDecoration(
                color: Colors.amberAccent
              ),
            ),
            ListTile(
              title: Text("Login"),
              leading: Icon(Icons.security),
              trailing: Icon(Icons.arrow_right),
              onTap: (){

              },
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.arrow_right),
              onTap: (){

              },
            ),
            ListTile(
              title: Text("News"),
              leading: Icon(Icons.chrome_reader_mode),
              trailing: Icon(Icons.arrow_right),
              onTap: (){

                Navigator.pop(context); // This is for closing the Drawer

                // Move from current UI to the Other UI :)
                Navigator.push(   // startActivity()
                    context,
                    MaterialPageRoute( // Intent
                        builder: (context) => NewsWidget()
                    )
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: HomeBody(),
    );
  }
}

// Assignment: Try clubbing both of the examples in the same page
//             The same UI Page should have tabs as well as NavigationDrawer