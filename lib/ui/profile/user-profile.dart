import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/fooddeliveryapp/splash.dart';
import 'package:gw2020f1/fooddeliveryapp/user.dart';
import 'package:gw2020f1/model/util.dart';
import 'package:gw2020f1/ui/order/my-orders.dart';
import 'package:image_picker/image_picker.dart';

uploadImageToFirebaseStorage(String path) async{

  File image = File(path);

  StorageReference storage = FirebaseStorage.instance.ref();
  StorageReference profilePicsStorage = storage.child("profile-pics/");
  StorageTaskSnapshot snapshot = await profilePicsStorage.child("profile_pic_${Utils.UID}.jpg").putFile(image).onComplete;

  if(snapshot.error==null){
    String profileImageURL = await snapshot.ref.getDownloadURL();
    // Edit User Document fo the URL in Profile in FirebaseFirestore :)
    print("Image Uploaded and UID is: ${Utils.UID}");

    Firestore db = Firestore.instance;
    db.collection("users").document(Utils.UID).updateData({"imageURL": profileImageURL}).then((value){
      print("URL Updated");
    });
  }

  return true;
}

Future<Map<String, dynamic>> fetchUserDetails() async{
  Firestore db = Firestore.instance;
  DocumentSnapshot documentSnapshot = await db.collection(Utils.USERS_COLLECTION).document(Utils.UID).get();
  return documentSnapshot.data;
}

class UserProfile extends StatefulWidget {
  createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {

  File imageFile;

  String name = "";
  String email = "";
  String imageURL = "";

  @override
  void initState() {
    super.initState();

    fetchUserDetails().then((Map<String, dynamic> map){
      setState(() {
        name = map['name'];
        email = map['email'];
        imageURL = map['imageURL'];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Card(
            child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                //child: Image.file(imageFile)
                backgroundImage: imageURL == null ? AssetImage('assets/john.jpeg') : NetworkImage(imageURL),
                radius: 100,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Divider(),
              Text(name),
              Text(email),
            ],
          ),
          onTap: () async {
            /*
            // When libraries have been initialized execute below code
            WidgetsFlutterBinding.ensureInitialized();
            // first camera and second camera
            final cameras = await availableCameras();
            //final camera = cameras[0];    // back
            //final camera = cameras.first; // back
            final camera = cameras[1]; // front

            String imagePath = await Navigator.pushNamed(context, "/capture", arguments: camera);
            */

            //imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
            PickedFile pickedFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
            //setState(() {});// ImageSource.camera
            // Display the image ->  Image.file(File(imagePath)),

            uploadImageToFirebaseStorage(pickedFile.path);
          },
        )),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(
            "Manage Details",
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle:
              Text("update your details", style: TextStyle(fontSize: 16.0)),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/manage-profile", arguments: "John");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.home),
          title: Text(
            "Manage Address",
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle: Text("add, delete your addresses",
              style: TextStyle(fontSize: 16.0)),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, "/manage-address");
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(
            "Orders",
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle: Text("View Your Previous Orders",
              style: TextStyle(fontSize: 16.0)),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => MyOrdersPage(),
            );
            Navigator.push(context, route);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.help),
          title: Text(
            "Help",
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle:
              Text("FAQ's about the App", style: TextStyle(fontSize: 16.0)),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {

          },
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle:
          Text("Logout from the App", style: TextStyle(fontSize: 16.0)),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut().then((value){
              Navigator.pushReplacement(   // startActivity()
                  context,
                  MaterialPageRoute( // Intent
                      builder: (context) => SplashPage()
                  )
              );
            });
          },
        )
      ],
    );
  }
}
