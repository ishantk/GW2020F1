import 'package:flutter/material.dart';

// Import core and the other library as requried by you
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Firestore DB Operations",
      //home: FirebaseOperationsWidget(),
      home: FetchWidget(),
    );
  }
}

class FetchWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Firebase Operations"),
    ),
    body: Center(
      child: FetchSingleDocWidget(),
    )
    );
  }
}

class User{
  String name;
  String email;
  String gender;
  int age;
  String phone;

  User({this.name, this.email, this.gender, this.age, this.phone});

  Map<String, dynamic> getUserMap(){
    return {
      'name':this.name,
      'email':this.email,
      'gender':this.gender,
      'age':this.age,
      'phone':this.phone
    };
  }

}

class FetchSingleDocWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    CollectionReference cRef = Firestore.instance.collection("users");
    final String docId = "9876512345";

    return FutureBuilder<DocumentSnapshot>(
      future: cRef.document(docId).get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError){
          return Container(
              child: Center(
                  child: Text("Something Went Wrong")
              ),
          );
        }

        // we have retrieved the data :)
        if (snapshot.connectionState == ConnectionState.done){
          return Container(
            child: Center(
                child: Text("User Details: ${snapshot.data['name']} ${snapshot.data['age']}")
            ),
          );
        }

        return Container(
          child: Center(
              child: Text("Fetching Data...")
          ),
        );

      },
    );
  }
}

class FirebaseOperationsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    CollectionReference cRef = Firestore.instance.collection("users");

    // Nested Function -> Function within the Function
    // addUser is an sync function i.e. runs in the background and whenever some result is achieved, will return a Future
    // in our use case here, we are returning a Future of type void -> return nothing in Future
    Future<void> addUser() async{

      // Access the DataBase
      // Access the Collection. May be created or may not be created
      // API: CollectionReference

      // Document Id's will be generated automatically

      /*return cRef.add({
        'name': 'Mike',
        'email': 'mike@example.com',
        'gender': 'male',
        'age': 24
      })*/

      //User user = User(name:"Leo", email:"leo@example.com", gender:"male", age:30);
      //return cRef.add(user.getUserMap())

      // We provide Document ID

      User user = User(name:"Fionna", email:"fionna@example.com", gender:"female", age:28, phone:"9809809809");
      return cRef.document(user.phone).setData(user.getUserMap())
      .then((value) => print("User Added Successfully"))
      .catchError((error) => print("Some Error Occurred while adding the User $error"));
    }

    Future<void> updateUser() async{
      User user = User(name:"Leo Jackson", email:"leo.jackson@example.com", gender:"male", age:32, phone:"9876512345");
      cRef.document(user.phone).setData(user.getUserMap())
          .then((value) => print("User Updated Successfully"))
          .catchError((error) => print("Some Error Occurred while Updating the User $error"));
    }

    Future<void> deleteUser() async{
      final String docId = "9915571177";
      cRef.document(docId).delete()
          .then((value) => print("User $docId Deleted Successfully"))
          .catchError((error) => print("Some Error Occurred while Updating the User $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Operations"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Add User"),
              onPressed: addUser,
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              child: Text("Update User"),
              onPressed: updateUser,
            ),
            SizedBox(
              height: 16.0,
            ),
            RaisedButton(
              child: Text("Delete User"),
              onPressed: deleteUser,
            )
          ],
        ),
      ),
    );
  }
}