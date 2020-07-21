import 'package:flutter/material.dart';
import 'package:gw2020f1/ui/auth/login.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3), (){
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          )
        );
    }
    );

    return Scaffold(
      body: Center(
        //child: Image
        child: Text("Food Delivery", style: TextStyle(fontSize: 24.0),),
      ),
    );

  }
}