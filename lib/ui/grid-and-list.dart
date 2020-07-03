import 'package:flutter/material.dart';

class GridListApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grid List App",
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
        //child: getListView(),
        child: getGridView()
      ),
    );
  }
}

Widget getGridView() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(6),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: getGridTiles(),
);


List<Container> getGridTiles(){
  return <Container>[
    Container(
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(width: 4, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      margin: EdgeInsets.all(4),
      child: Image.asset("assets/batista.jpg"),
    ),
    Container(
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      margin: EdgeInsets.all(4),
      child: Image.asset("assets/john.jpeg"),
    ),
    Container(
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      margin: EdgeInsets.all(4),
      child: Image.asset("assets/tripleh.jpeg"),
    ),
    Container(
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      margin: EdgeInsets.all(4),
      child: Image.asset("assets/rock.jpeg"),
    )
  ];
}

Widget getListView() => ListView(
  children: [
    getListTile("BCC", "BCC News Channel", Icons.note),
    getListTile("CNN", "CNN News Channel", Icons.security),
    getListTile("NDTV", "NDTV News Channel", Icons.account_circle),
    getListTile("AAJ TAK", "AAJ TAK News Channel", Icons.keyboard),
    getListTile("INDIA TODAY", "INDIA TODAY News Channel", Icons.home),
    getListTile("REPUBLIC", "REPUBLIC News Channel", Icons.person),
  ],
);

ListTile getListTile(String title, String text, IconData icon) => ListTile(

  title: Text(
    title,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: Colors.amber
    ),
  ),

  subtitle: Text(
      text,
      style: TextStyle(color: Colors.green),
  ),

  leading: Icon(
      icon,
    color: Colors.deepPurple[700],
  ),

);