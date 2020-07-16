import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gw2020f1/fooddeliveryapp/register.dart'; // Just a helper library may or may not be used

// FirebaseAuth is reference to Authentication Module of our Firebase Project
final FirebaseAuth auth = FirebaseAuth.instance;


class LoginPage extends StatefulWidget{

  final String title = "Login";

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{

  // keys are unique identifiers for the widgets
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoggedIn; // by default null
  String message;    // by default null

  @override
  Widget build(BuildContext context) {
    // widget is a reference variable pointing to RegisterPage Widget and we can access its attributes from this reference
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 6.0,),
              Icon(Icons.home),
              SizedBox(height: 2.0,),
              Text("LOGIN WITH YOUR DETAILS"),
              SizedBox(height: 2.0,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Your Email'),
                controller: emailController,
                validator: (String value) {
                  if(value.isEmpty){
                    return "Please Enter Your Email"; // here, we are returning back a message, hence validation is NOT OK
                  }else{
                    if(!value.contains("@") && !value.contains(".")){ // contains can work with regular expressions as well
                      return "Please Enter Valid Email";
                    }
                  }
                  return null; // if we don't return anything, it means validation is OK
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Your Password'),
                controller: passwordController,
                obscureText: true,
                validator: (String value) {
                  if(value.isEmpty){
                    return "Please Enter Your Password"; // here, we are returning back a message, hence validation is NOT OK
                  }else{
                    if(value.length <= 6){
                      return "Please Enter Password of min 7 characters";
                    }
                  }
                  return null; // if we dont return anything, it means validation is OK
                },
              ),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: RaisedButton(
                  child: const Text("Login"),
                  onPressed: () async {
                    if(formKey.currentState.validate()){
                      loginUserWithFirebase();
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: RaisedButton(
                  child: const Text("Register With Us"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        )
                    );
                  }
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                child: Text(
                    isLoggedIn == null ? " " : message
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  // Memory Clean Up :)
  @override
  void dispose() {
    // Whenever the Widget is disposed, dispose will be executed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // In the State of Widget
  void loginUserWithFirebase() async{
    // Obtain Reference of the FirebaseUser which will be created in the FirebaseAuth Module inf Firebase Project
    FirebaseUser user = (await
    auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text)
    ).user;

    if(user != null){

      // take the user directly to the Home
      // Use Navigator.push to take the user to HomePage
      // show circular Loading while Firebase is either logging in or registering the user in the background

      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refreshed
        // user is registered without any errors :)
        message = "User Signed In Successfully. Details: ${user.email} | ${user.uid}";
        isLoggedIn = true;
      });

    }else{
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refreshed
        // user isnt registered or some error    :(
        message = "User Not Signed In";
        isLoggedIn = false;
      });
    }
  }

}