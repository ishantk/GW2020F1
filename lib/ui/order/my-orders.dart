import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/model/util.dart';

final Firestore db = Firestore.instance;

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    CollectionReference orders = db
        .collection(Utils.ORDER_COLLECTION)
        .where("userID", isEqualTo: Utils.UID).reference();

    return Scaffold(
      appBar: AppBar(
        title: Text("ORDERS"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: orders.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong. Please Try Again"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Please Wait..."),
            );
          }

          // Presentation of All the Restaurants in the DataBase in restaurants collection
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      document.data['orderDateTime'].toString(),
                      style: TextStyle(fontSize: 24.0, color: Colors.amber),
                    ),
                    Divider(),
                    Text(
                      document.data['totalPrice'].toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
