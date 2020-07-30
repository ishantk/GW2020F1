import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  /*@override
  _LoginPageState createState() {
    return _LoginPageState();
  }*/

  _LoginPageState createState() => _LoginPageState();
}

// Widget shall be build in the State instead of the above class :)
class _LoginPageState extends State<LoginPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0), // padding vs margin
          children: <Widget>[
            SizedBox(height: 80.0,), // A box with a specified size as in the height
            Column(
              children: <Widget>[
                Image.asset('assets/ic_login.png'),
                SizedBox(height: 16.0,),
                Text("Welcome to Food Delivery App")
              ],
            ),
            SizedBox(height: 100.0,),
            TextField(
              decoration: InputDecoration(
                filled: true,
                //fillColor: Colors.cyan,
                labelText: 'Phone Number'
              ),
            ),
            SizedBox(height: 16.0,),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  labelText: 'OTP'
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0,),
            ButtonBar(
              children: [
                FlatButton(
                  child: Text("EXIT"),
                  onPressed: (){

                  },
                ),
                RaisedButton(
                  child: Text("PROCEED"),
                  onPressed: (){

                  },
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

// Assignment: Create a Background for the Above Login Page in a Gradient :)
//             Changing Size of the Widgets
//             Draw the Widget Tree Structure in your notebook or paint and share in WhatsApp Group
