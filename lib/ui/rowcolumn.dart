import 'package:flutter/material.dart';


class RowColumnApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Material App",
        home: ImagesPageWithCard()
    );
  }
}

class ImagesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Column App"),
      ),
      body: Center(

        //child: Row(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Expanded(
                //flex: 2,
                child: Image.asset('assets/mask.png')
              ),
              Expanded(
                child: Image.asset('assets/soap.png')
              ),
              Expanded(
                child: Image.asset('assets/temperature.png')
              )
          ],
        )
      ),
    );
  }
}

class ImagesPageWithCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Column App"),
      ),
      body: Center(
        child:Container(
          margin: EdgeInsets.fromLTRB(10, 20, 0, 20),
          height: 400,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Image.asset('assets/mask.png')
                ),
                Expanded(
                    child: Image.asset('assets/soap.png')
                ),
                Expanded(
                    child: Image.asset('assets/temperature.png')
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}

