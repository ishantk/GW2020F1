import 'package:flutter/material.dart';

class ListApp extends StatelessWidget{

  // build method will be executed automatically by flutter fw
  // and returned widget will be the child of BuildContext
  @override
  Widget build(BuildContext context) {
    // The below syntax isn't optimized as we are creating more references in memory
    /*
    ThemeData theme = new ThemeData(primarySwatch: Colors.teal);
    Text text = new Text("MyListApp");
    AppBar appBar = new AppBar(title: text);
    Scaffold scaffold = new Scaffold(appBar: appBar,);
    MaterialApp app = new MaterialApp(title: "MyListApp", theme: theme, home: scaffold,);
    return app;
    */

    // How Industry Works
    // Saves Extra References and makes the code more readable for us
    return MaterialApp(

        title: "MyListApp",

        theme: ThemeData(
            primarySwatch: Colors.teal
        ),

        home: Scaffold(
            appBar: AppBar(
                title: Text("MyListApp")
            ),
          body: HomeBody(),
        )
    );
  }
}

class HomeBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //return createNewsListView(context);
    //return createBrandsListView(context);
    return createDynamicNewsListView(context);
    //return createColorSwatches(context);
  }
}

Widget createNewsListView(BuildContext context){
  return ListView(
    padding: EdgeInsets.all(8.0),
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Text("CNN IBN"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Text("BCC"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Text("NDTV"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Text("REPUBLIC"),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Text("AAJ TAK"),
        trailing: Icon(Icons.keyboard_arrow_right),
      )
    ],
  );
}

Widget createBrandsListView(BuildContext context){
  return ListView(
      padding: EdgeInsets.all(8.0),
      children: ListTile.divideTiles(
          context: context,
          tiles: <Widget>[
            ListTile(
              title: Text("Nike"),
            ),
            ListTile(
              title: Text("Adidas"),
            ),
            ListTile(
              title: Text("Levis"),
            ),
            ListTile(
              title: Text("US Polo"),
            ),
            ListTile(
              title: Text("Clarks"),
            )
          ]
      )

  );
}

Widget createDynamicNewsListView(BuildContext context){

  final news = ["CNN", "NDTV", "REPUBLIC", "BCC", "AAJ TAK", "INDIA TV"];

  /*
  return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) { // index will begin from 0 till news.length
        return ListTile(
          leading: Icon(Icons.chrome_reader_mode),
          title: Text(news[index]),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      },
  );*/

  return ListView.separated(
    itemCount: news.length,
    itemBuilder: (context, index) { // index will begin from 0 till news.length
      return ListTile(
        leading: Icon(Icons.chrome_reader_mode),
        title: Text(news[index]),
        trailing: Icon(Icons.keyboard_arrow_right),
      );
    },
    separatorBuilder: (context, index) {
      return Divider(
        color: Colors.amber,
      );
    },
  );
}

Widget createColorSwatches(BuildContext context){

  final colors = <String>[
    "100   #FFCDD2",
    "200   #EF9A9A",
    "300   #E57373",
    "400   #EF5350",
    "500   #F44336"
  ];

  final codes = <int>[
    100,
    200,
    300,
    400,
    500
  ];

  // https://material.io/design/color/the-color-system.html#tools-for-picking-colors
  return ListView.builder(
    padding: EdgeInsets.all(8.0),
    itemCount: colors.length,
    itemBuilder: (context, index) { // index will begin from 0 till news.length
      return Container(
        height: 60,
        color: Colors.red[codes[index]],
        child: Center(child: Text("Data: ${colors[index]}"),),
      );
    },
  );

}

// Assignment: Explore GridView
//             Explore Horizontal Scrolling in ListView