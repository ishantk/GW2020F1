import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "My App",
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      //body: FutureBuilder<String>(
      body: Center(
        child: RaisedButton(
          child: Text("Launch Profile Page"),
          onPressed: (){
            var transition = getAnimatedRoute();
            Navigator.of(context).push(transition);
          },
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      //body: FutureBuilder<String>(
      body: Center(
        child: Text("My Profile Page"),
        ),
      );
  }
}

// Tween Animation Reference : https://api.flutter.dev/flutter/animation/Tween-class.html
getAnimatedRoute(){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ProfilePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {

      var begin = Offset(0.5, 0.5);
      var end = Offset.zero;
      var curve = Curves.ease;

      // Tween Animation Object
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}