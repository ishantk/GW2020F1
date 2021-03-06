import 'package:flutter/material.dart';
import 'package:gw2020f1/ui/selectpromos.dart';
import 'package:gw2020f1/model/Promo.dart';

class ZomatoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UI Navigation with Data",
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Apply Promo Code"),
          onPressed: (){
            showResultFromPromoCodes(context);
          },
        ),
      ),
    );
  }
}

// The Function Below is executed and is going to get some result back from the PromoCodes UI
// Let us make this function async i.e. let it execute in the background
showResultFromPromoCodes(BuildContext context) async {
  final Promo result = await Navigator.push(   // startActivity()
                 context,
                 MaterialPageRoute( // Intent
                    builder: (context) => PromoCodes()
                 )
                );

  String message = "Promo Code Details Name: ${result.name} and Discount: ${result.discount}";
  // HW: Display the Above Message in AlertDialog

  showAlertDialog(context, message);

}

showAlertDialog(BuildContext context, String message){
  // Solution
  return showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Promo Code Applied"),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text("Done"),
              onPressed: (){
                Navigator.of(context).pop(); // Dismiss the Dialog i.e. remove from memory itself
              },
            )
          ],
        );
      }
  );
}