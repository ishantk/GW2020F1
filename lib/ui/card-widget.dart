import 'package:flutter/material.dart';


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container App"),
      ),
      body: Center(
       child: getCard(),
      ),
    );
  }
}

Widget getCard() => Expanded(
  child:SizedBox(
  height: 380,
  child: Card(
    color: Colors.grey,
    margin: EdgeInsets.all(8),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(width: 4, color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(6))
          ),
          margin: EdgeInsets.all(4),
          child: Image.asset("assets/batista.jpg"),
        ),
        ListTile(
          title: Text(
            "Tikka Junction",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          subtitle: Text("Mughlai, North India, Chinese"),
          leading: Icon(Icons.restaurant, color: Colors.amber,),
        ),
        Divider(),
        ListTile(
          title: Text(
            "Rs 250 per person",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          subtitle: Text("Model Town"),
        )
      ],
    ),
  ),
)
);