import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/fooddeliveryapp/splash.dart';
import 'package:gw2020f1/ui/home/cart.dart';
import 'package:gw2020f1/ui/home/filters.dart';
import 'package:gw2020f1/ui/profile/user-profile.dart';
import 'package:gw2020f1/ui/restaurants/restaurants.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

//class HomePage extends StatelessWidget{
//
//  // static is property of class and not of object
//  // Hence, without creating object we can access it with class name
//  static const String title = "Welcome";
//
//  @override
//  Widget build(BuildContext context) {
//
//    return MaterialApp(
//      title: title,
//      home: HomePageWidget(),
//    );
//
//  }
//
//}

class HomePage extends StatefulWidget{

  // Create Constructor with the key and pass it to super
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage>{

  int index = 0;

  // static const is genrally property of class which cannot be changed and can be accessed by the class name in any other class as well
  static const TextStyle myTextStyle = TextStyle(
      fontSize: 24.0,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.amber
  );

  static List<Widget> widgets = [
    // 0
    //RestaurantsPage(),
    HomePageWithFilters(),
    // 1
    Text(
        "Start Searching Your Music",
        style: myTextStyle
    ),
    // 2
    UserProfile()
  ];

  // User Defined Function, but input strictly must be integer as it is suppose to be the index
  void navItemClicked(int i){
    // Execution of setState function
    // Redraw the Widget to reflect changes on UI
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: widgets.elementAt(index),
      ),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'CART',
            onPressed: (){
              Navigator.push(   // startActivity()
                  context,
                  MaterialPageRoute( // Intent
                      builder: (context) => ShoppingCartPage()
                  )
              );
            },
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar( // When we do not want floating action button, else it will overlap
        items: <BottomNavigationBarItem>[
          // 0
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
          ),
          // 1
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search")
          ),
          // 2
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile")
          )
        ],
        currentIndex: index,
        selectedFontSize: 14.0,
        selectedItemColor: Colors.orange,
        onTap: navItemClicked, // automatically, index of the current bottom navigation item will be passed as an integer
      ),
    );

  }

}