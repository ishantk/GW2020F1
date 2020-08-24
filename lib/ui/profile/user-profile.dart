import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/ui/order/my-orders.dart';

class UserProfile extends StatefulWidget {
  createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  
  
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
                backgroundImage: AssetImage('assets/john.jpeg'),
                radius: 100,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Divider(),
              Text("User Name"),
              Text("Email"),
            ],
          ),
          onTap: () async {
            // When libraries have been initialized execute below code
            WidgetsFlutterBinding.ensureInitialized();
            // first camera and second camera
            final cameras = await availableCameras();
            //final camera = cameras[0];    // back
            //final camera = cameras.first; // back
            final camera = cameras[1]; // front

            String imagePath = await Navigator.pushNamed(context, "/capture", arguments: camera);

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
          onTap: () {},
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
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => MyOrdersPage(),
            );
            Navigator.push(context, route);
          },
        ),
      ],
    );
  }
}
