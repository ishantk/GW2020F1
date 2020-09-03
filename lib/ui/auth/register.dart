import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gw2020f1/model/user.dart';
import 'package:gw2020f1/ui/home/home.dart';

// FirebaseAuth is reference to Authentication Module of our Firebase Project
final FirebaseAuth auth = FirebaseAuth.instance;

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;

class RegisterPage extends StatefulWidget{

  final String title = "Register Yourself";

  @override
  RegisterPageState createState() => RegisterPageState();
}

enum Gender {
  Male,
  Female,
}

class RegisterPageState extends State<RegisterPage>{

  // keys are unique identifiers for the widgets
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isRegistered; // by default null
  String message;    // by default null

  Gender gender = Gender.Female;

  @override
  Widget build(BuildContext context) {
    // widget is a reference variable pointing to RegisterPage Widget and we can access its attributes from this reference
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),

      body: Form(
        key: formKey,
        child: ListView( // Change the Column to ListView to Solve Your Problem
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            SizedBox(height: 12.0,),
            Image.asset('assets/ic_login.png'),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Your Name'),
              controller: nameController,
              validator: (String value) {
                if(value.isEmpty){
                  return "Please Enter Your Name"; // here, we are returning back a message, hence validation is NOT OK
                }
                return null; // if we don't return anything, it means validation is OK
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter Your Email'),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
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
            TextFormField(   // Input Type must be strictly Numbers
              decoration: InputDecoration(labelText: 'Enter Your Phone'),
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: (String value) {
                if(value.isEmpty){
                  return "Please Enter Your Phone"; // here, we are returning back a message, hence validation is NOT OK
                }else{
                  if(value.length!=10){
                    return "Phone Number must be 10 digits";
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
            Column(
               children: <Widget>[
                  RadioListTile<Gender>(
                    title: const Text("FEMALE"),
                    value: Gender.Female,
                    groupValue: gender,
                    onChanged: (Gender value){
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                 RadioListTile<Gender>(
                   title: const Text("MALE"),
                   value: Gender.Male,
                   groupValue: gender,
                   onChanged: (Gender value){
                     setState(() {
                       gender = value;
                     });
                   },
                 )
               ],
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

  Future<void> addUser(String uid, User userData) async{
    print("Adding User to DataBase");
    CollectionReference cRef = Firestore.instance.collection("users");

    /*Future<DocumentReference> doc = cRef.add(userData.toMap());
    doc.then((value){
      String docId = value.documentID;
    });
    */

    cRef.document(uid).setData(userData.toMap())
        .then((value) {
            print("User Added Successfully");
            Navigator.pushReplacement(   // startActivity()
                context,
                MaterialPageRoute( // Intent
                    builder: (context) => HomePage()
                )
            );
        })  // Use Navigator.push to take the user to HomePage
        .catchError((error) => print("Some Error Occurred while adding the User $error"));
  }

  // In the State of Widget
  void registerUserInFirebase() async{

    User userData = User.initWithAddresses(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      gender: gender.toString(),
      addresses: null
    );

    // Obtain Reference of the FirebaseUser which will be created in the FirebaseAuth Module inf Firebase Project
    FirebaseUser user = (await
                            auth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text)
                        ).user;

    //    auth.createUserWithEmailAndPassword(email: null, password: null)
    //        .then((value) => null)
    //        .catchError(onError)

    await addUser(user.uid, userData);

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
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refreshed
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
        // user is registered without any errors :)
        message = "User Signed In Successfully. Details: ${user.email} | ${user.uid}";
        isRegistered = true;
      });

    }else{
      setState(() { // Re-Draw the UI with updated Data i.e. Change in Data leads to Change in State of the Widget and Hence UI must be Refreshed
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