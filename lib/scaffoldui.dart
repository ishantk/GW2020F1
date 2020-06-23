import 'package:flutter/material.dart';

class ScaffoldApp extends StatelessWidget{

  String title = 'Scaffold App';

  @override
  Widget build(BuildContext context) {
    /*
    var sRef = ScaffoldHomePage();
    var mRef = MaterialApp(title: title, home:sRef);
    return mRef;*/

    return MaterialApp(
      title: title,
      home: ScaffoldHomePage(),
    );

  }
}

// Whenever you need to do the changes in the UI for the user to display some data
// In Zomato, time to deliver the food item to yur home may change and hence,
// we should construct StatefulWidget

class ScaffoldHomePage extends StatefulWidget{

  // If we create constructor, you must take key as input and pass it to the parent
  ScaffoldHomePage({Key key}) : super(key: key);

  /*
  @override
  ScaffoldHomePageState createState() {
    return ScaffoldHomePageState();
  }*/

  ScaffoldHomePageState createState() => ScaffoldHomePageState();
}

class ScaffoldHomePageState extends State<ScaffoldHomePage>{

  int i = 0;
  var quotes = <String>[
    "Be Exceptional",
    "Work Hard, Get Luckier",
    "Good Day for Good People",
    "Set Your Goals Today",
    "Their is nothing like Past"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Text("Quote: ${quotes[i]}"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        tooltip: "Show Quote",
        onPressed: (){
          // setState is a built in function which will refresh the UI for us with changes :)
          // build method will be re executed and new ui will be again drawn for us
          setState(() {
            i++;
            if(i == 5){
              i = 0;  // so as we can move the list to 0 again to rotate the quotes
            }
            // after this, build will bre re executed with latest value for quote
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container( // Empty Rectangle
          height: 50.0,
        ),
      ),
    );
  }
}

// Assignment: Create a Game called, Rock Paper Scissors
//             OR simply randomize the quotes which are as of now coming in a sequence