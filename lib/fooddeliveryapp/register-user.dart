import 'package:flutter/material.dart';

class RegisterUserUI extends StatefulWidget{

  _RegisterUserUIState createState() => _RegisterUserUIState();
}

// Widget shall be build in the State instead of the above class :)
class _RegisterUserUIState extends State<RegisterUserUI>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0), // padding vs margin
            children: <Widget>[
              SizedBox(height: 40.0,), // A box with a specified size as in the height
              Column(
                children: <Widget>[
                  Image.asset('assets/ic_login.png'),
                  SizedBox(height: 16.0,),
                  Text("Welcome to Food Delivery App"),
                  SizedBox(height: 8.0,),
                  Text("Register Yourself")
                ],
              ),
              SizedBox(height: 60.0,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    //fillColor: Colors.cyan,
                    labelText: 'Enter Your Name'
                ),
              ),
              SizedBox(height: 16.0,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    //fillColor: Colors.cyan,
                    labelText: 'Enter Your Phone'
                ),
              ),
              SizedBox(height: 16.0,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter Your Email'
                ),
              ),
              SizedBox(height: 16.0,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter Your Password'
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0,),
              RadioListTile(
                title: Text("Male"),
              ),
              RadioListTile(
                title: Text("Female"),
              ),
              SizedBox(height: 16.0,),
              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("REGISTER"),
                    onPressed: (){
                      
                    },
                  ),
                  RaisedButton(
                    child: Text("QUIT"),
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