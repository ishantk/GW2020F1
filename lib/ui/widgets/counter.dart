import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:gw2020f1/model/util.dart';

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;


class CounterWidget extends StatefulWidget {

  String dishDocumentId;
  int dishPrice;
  int initialQuantity;

  CounterWidget({Key key, @required this.dishDocumentId, @required this.dishPrice,  @required this.initialQuantity}) : super(key: key);

  @override
  CounterWidgetState createState() {
    return CounterWidgetState();
  }
}

class CounterWidgetState extends State<CounterWidget>{

  int count = 0;

  CollectionReference cart = db.collection(Utils.USERS_COLLECTION)
      .document(Utils.UID)
      .collection(Utils.CART_COLLECTION);

  void updateDishQuantityInFirestore(){

    cart.document(widget.dishDocumentId).updateData({"quantity":count, "totalPrice": (widget.dishPrice*count)})
        .then((value) => print("Dish Updated Successfully"))
        .catchError((error) => print("Some Error Occurred while Updating the User $error"));
  }

  @override
  Widget build(BuildContext context) {

    count = widget.initialQuantity;

    return Center(
        child: Counter(
          initialValue: count,
          minValue: 1,
          maxValue: 5,
          step: 1,
          decimalPlaces: 0,
          onChanged: (value) { // get the latest value from here
            setState(() {      // refresh the Widget by executing build function again for us
              count = value;
              updateDishQuantityInFirestore();
            });
          },
        ),
      );
  }
}