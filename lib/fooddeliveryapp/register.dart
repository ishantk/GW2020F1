import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart'; // Just a helper library may or may not be used

// FirebaseAuth is reference to Authentication Module of our Firebase Project
final FirebaseAuth auth = FirebaseAuth.instance;

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;

class RegisterPage extends StatefulWidget{

  final String title = "Register Yourself";

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{

  // keys are unique identifiers for the widgets
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRegistered; // by default null
  String message;    // by default null

  @override
  Widget build(BuildContext context) {
    // widget is a reference variable pointing to RegisterPage Widget and we can access its attributes from this reference
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_open),
            tooltip: 'SignOut',
            onPressed: (){
              signOut();
            },
          )
        ],
      ),

      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 12.0,),
            Image.asset('assets/ic_login.png'),
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
                return null; // if we dont return anything, it means validation is OK
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
                child: const Text("Register"),
                //child: const Text("Login"),
                onPressed: () async {
                  if(formKey.currentState.validate()){
                      registerUserInFirebase();
                    //loginUserWithFirebase();
                  }
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text(
                  isRegistered == null ? " " : message
              ),
            )
          ],
        ),
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

  Future<void> addUser(String uid, String email, String password) async{
    print("Adding User to DataBase");
    CollectionReference cRef = Firestore.instance.collection("users");
    cRef.document(uid).setData({'email':email, 'password':password})
        .then((value) => print("User Added Successfully"))
        .catchError((error) => print("Some Error Occurred while adding the User $error"));
  }

  // In the State of Widget
  void registerUserInFirebase() async{
    // Obtain Reference of the FirebaseUser which will be created in the FirebaseAuth Module inf Firebase Project
    FirebaseUser user = (await
                            auth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                        ).user;

    await addUser(user.uid, emailController.text, passwordController.text);

    if(user != null){
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refresehd
        // user is registered without any errors :)
        message = "User Registered Successfully. Details: ${user.email} | ${user.uid}";
        isRegistered = true;
      });
    }else{
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refresehd
        // user isnt registered or some error    :(
        message = "User Not Registered";
        isRegistered = false;
      });
    }
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
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refresehd
        // user is registered without any errors :)
        message = "User Signed In Successfully. Details: ${user.email} | ${user.uid}";
        isRegistered = true;
      });

    }else{
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refresehd
        // user isnt registered or some error    :(
        message = "User Not Signed In";
        isRegistered = false;
      });
    }
  }

  void signOut(){
    auth.signOut();
    // and do some other stuff here :)
  }

  // Anytime the User who has signed in or registered with us, we can obtain uid for user with below snippet
  getUID() async{
    final String uid = (await auth.currentUser()).uid;
    return uid;
  }

}