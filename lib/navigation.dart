import 'package:flutter/material.dart';

class NavApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyNavApp",
      //home: HomeWidget(),
      // industrial standard
      routes: { // Map or Dictionary i.e. Key Value Pair :)
        '/': (context) => HomeWidget(),
        '/dashboard': (context) => DashBoardWidget(),
      },
      initialRoute: '/',
    );
  }
}

class HomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("Home"),
    ),
    body: Center(
      child: RaisedButton(
        child: Text("DashBoard"),
        onPressed: (){  // Anonymous Function
          //MaterialPageRoute route = MaterialPageRoute(builder: (context) => DashBoardWidget(),);
          //Navigator.push(context, route);

          /*
          // Pushing another widget in UI Stack
          Navigator.push(   // startActivity()
            context,
            MaterialPageRoute( // Intent
                builder: (context) => DashBoardWidget()
            )
          );
          */

          Navigator.pushNamed(context, '/dashboard');

        },
      ),
    ),
   );
  }

}

class DashBoardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Back"),
          onPressed: (){  // Anonymous Function
            Navigator.pop(context); // Kill the Widget and remove it from the Stack
          },
        ),
      ),
    );
  }

}