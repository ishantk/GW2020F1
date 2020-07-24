import 'package:flutter/material.dart';
import 'package:gw2020f1/ui/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gw2020f1/ui/home/home.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

getUID() async{
  final String uid = (await auth.currentUser()).uid;
  return uid;
}

class SplashPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // Firebase will maintain a security token in our app if user has logged in or registered
    // security token and some other details as well will be maintained
    // example -> we can have the access to the user id off Auth module
    auth.currentUser().
      then((FirebaseUser user){

        if (user != null){
          print("Firebase User Data is: $user");
          String uid = user.uid;
          print("UID IS: $uid");

          Future.delayed(Duration(seconds: 1), (){
            //Navigator.push(context,
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )
            );
          });

        }else{

          Future.delayed(Duration(seconds: 1), (){
            //Navigator.push(context,
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )
            );
          });
        }

      });

    return Scaffold(
      body: Center(
        //child: Image
        child: Text("Food Delivery", style: TextStyle(fontSize: 24.0),),
      ),
    );

  }
}