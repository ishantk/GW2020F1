import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gw2020f1/model/util.dart';
import 'package:gw2020f1/ui/auth/register.dart';
import 'package:gw2020f1/ui/home/home.dart';

// Please Explore Connectivity Module for Subscriptions: https://pub.dev/packages/connectivity


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

  int status = 0;

  @override
  Widget build(BuildContext context) {

    if (Utils.checkInternetConnection()){
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.wifi, color: Colors.amber,),
                Text("Seems you are Not Connected to Internet\nPlease Connect and try Again !!", style:TextStyle(fontSize: 24.0, color: Colors.lightBlue))
              ],
            ),
          )
      );
    }else {
      if (status == 1) {
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 2.0),
                  Text("Logging In. Please Wait..",
                      style: TextStyle(fontSize: 24.0, color: Colors.lightBlue))
                ],
              ),
            )
        );
      } else if (status == 2) {
        // for invalid login, if you wish you can show some other details :)
      } else {
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
                      decoration: InputDecoration(
                          labelText: 'Enter Your Email'),
                      controller: emailController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter Your Email"; // here, we are returning back a message, hence validation is NOT OK
                        } else {
                          if (!value.contains("@") && !value.contains(
                              ".")) { // contains can work with regular expressions as well
                            return "Please Enter Valid Email";
                          }
                        }
                        return null; // if we don't return anything, it means validation is OK
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Enter Your Password'),
                      controller: passwordController,
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please Enter Your Password"; // here, we are returning back a message, hence validation is NOT OK
                        } else {
                          if (value.length <= 6) {
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
                        onPressed: ()  {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              status = 1;
                            });
                            Future<FirebaseUser> future = loginUserWithFirebase(context, emailController.text, passwordController.text);
                            future.then((FirebaseUser user){
                              if(user!=null){
                                navigateToHome(context);
                              }else{

                              }
                            });
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
    }
  }

  // Memory Clean Up :)
  @override
  void dispose() {
    // Whenever the Widget is disposed, dispose will be executed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}

navigateToHome(BuildContext context){
  Navigator.pushReplacement(   // startActivity()
      context,
      MaterialPageRoute( // Intent
          builder: (context) => HomePage()
      )
  );
}

// In the State of Widget
loginUserWithFirebase(BuildContext context, email, password){

  // FirebaseAuth is reference to Authentication Module of our Firebase Project
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Obtain Reference of the FirebaseUser which will be created in the FirebaseAuth Module inf Firebase Project
  auth.signInWithEmailAndPassword(email: email, password: password)
      .then((AuthResult result){
    FirebaseUser user = result.user;
    return user;
//    }else{
//      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refreshed
//        // user isnt registered or some error    :(
//        message = "User Not Signed In";
//        isLoggedIn = false;
//        //status = 2; handling is upto us
//      });
//    }
  });
}