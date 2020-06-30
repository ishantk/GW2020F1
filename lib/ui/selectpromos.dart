import 'package:flutter/material.dart';
import 'package:gw2020f1/model/Promo.dart';

class PromoCodes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Promo Code"),
      ),
      body: Center(
        child: Column(  // We wish to place some UI Widgets Vertically
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text("ZOMATO"),
                onPressed: (){
                  Promo promo = Promo("ZOMATO", 0.40);
                  //Navigator.of(context).pop();
                  //Navigator.pop(context, "ZOMATO Selected. Discount: 40%"); // Send Back the Data: "ZOMATO Selected. Discount: 40%"
                  Navigator.pop(context, promo);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text("JUMBO"),
                onPressed: (){
                 // Navigator.pop(context, "JUMBO Selected. Discount: 50%"); // Send Back the Data: "JUMBO Selected. Discount: 50%"
                  Promo promo = Promo("JUMBO", 0.50);
                  Navigator.pop(context, promo);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: RaisedButton(
                child: Text("BINGO"),
                onPressed: (){
                  //Navigator.pop(context, "BINGO Selected. Discount: 20%"); // Send Back the Data: "BINGO Selected. Discount: 20%"
                  Promo promo = Promo("BINGO", 0.20);
                  Navigator.pop(context, promo);
                },
              ),
            )
          ],
        ),
      ),
    );

  }
}