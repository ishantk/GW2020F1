import 'package:flutter/material.dart';
import 'package:gw2020f1/model/util.dart';
import 'package:gw2020f1/ui/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gw2020f1/ui/home/home.dart';


Future<int> checkFirebaseAuth() async{

  final FirebaseAuth auth = FirebaseAuth.instance;

  return await auth.currentUser().then((FirebaseUser user){
    if (user != null) {
      print("Firebase User Data is: $user");
      String uid = user.uid;
      Utils.UID = uid;
      print("UID IS: $uid");
      return 1;
    }else{
      return 0;
    }
  });

}

navigate(BuildContext context, Widget widget) {
  Future.delayed(Duration(seconds: 2), () {
    Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => widget,
        )
    );
  });
}

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    checkFirebaseAuth().then((value){
      if(value==1){
        navigate(context, HomePage());
      }else if(value == 0){
        navigate(context, LoginPage());
      }
    });

    // Firebase will maintain a security token in our app if user has logged in or registered
    // security token and some other details as well will be maintained
    // example -> we can have the access to the user id off Auth module

    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/app_icon.png"),
          ),
          SizedBox(
            height: 2.0,
          ),
          Text(
            "Food Delivery",
            style: TextStyle(fontSize: 24.0, color: Colors.orange),
          ),
        ],
      )),
    );
  }
}
