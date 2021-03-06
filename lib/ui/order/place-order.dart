import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gw2020f1/model/dish.dart';
import 'package:gw2020f1/model/orders.dart';
import 'package:gw2020f1/ui/order/payment-gateway-checkout.dart';
import 'package:gw2020f1/model/util.dart';

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

Future<String> fetchDishesFromCartAndPlaceOrder() async{

  Orders order = Orders();
  
  order.userID = Utils.UID;
  order.orderDateTime = DateTime.now();
  order.dishes = [];

  db.collection(Utils.USERS_COLLECTION).document(Utils.UID).collection(Utils.CART_COLLECTION)
      .getDocuments() // gives us a list of documents
      .then((QuerySnapshot value){
        List<DocumentSnapshot> docs = value.documents;

        order.restaurantID = docs[0]['restaurantId'];

        print("restaurantId: ${order.restaurantID}");
        /* Lambda Expression
        docs.forEach((DocumentSnapshot document) {

        });
        */

        // Enhanced for loop
        /*for(DocumentSnapshot document in docs){

        }*/

        // Traditional For loop
        for(int i=0;i<docs.length;i++){
          DocumentSnapshot document = docs[i];
          print(document.data.toString());
          Dish dish = Dish.initFromFirebase(name:document.data['name'], imageUrl: document.data['imageUrl'],
              description: document.data['description'], price: document.data['price'],
              quantity: document.data['quantity'], documentID: document.documentID);

          order.dishes.add(dish);
          order.totalPrice += dish.price;
        }

        db.collection(Utils.ORDER_COLLECTION).add(order.toMap())
            .then((DocumentReference document){
          print("Order Object Saved");

          // Delete The Documents from the Cart
          db.collection(Utils.USERS_COLLECTION).document(Utils.UID).collection(Utils.CART_COLLECTION).getDocuments().then((QuerySnapshot value){
            List<DocumentSnapshot> docs = value.documents;
            for(DocumentSnapshot document in docs){
              db.collection(Utils.USERS_COLLECTION).document(Utils.UID).collection(Utils.CART_COLLECTION).document(document.documentID).delete();
            }
          });

          return "Order Placed";

        });

      });
}

class PlaceOrderPage extends StatefulWidget {
  @override
  _PlaceOrderPageState createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {

  String message = "";

  @override
  Widget build(BuildContext context) {

    CollectionReference cart = db
        .collection(Utils.USERS_COLLECTION)
        .document(Utils.UID)
        .collection(Utils.CART_COLLECTION);

    return Scaffold(
      appBar: AppBar(
        title: Text("Place Order"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: cart.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong. Please Try Again"),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Presentation of All the Restaurants in the DataBase in restaurants collection
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              print("document: ${document.data.toString()}");
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.network(document.data['imageUrl']),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      document.data['name'],
                      style: TextStyle(fontSize: 24.0, color: Colors.amber),
                    ),
                    Divider(),
                    Text(
                      document.data['description'],
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    Text(
                      "Quantity: ${document.data['quantity']}",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      document.data['price'].toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                      "Total ${document.data['totalPrice'].toString()}",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: RaisedButton(
          child: Text("CONFIRM ORDER"),
          onPressed: () async {
            String message = await Navigator.push(context, MaterialPageRoute(
                builder: (context) => RazorPayCheckoutPage())
            );

            if(message.contains("SUCCESS") || message.contains("WALLET")){
              fetchDishesFromCartAndPlaceOrder();
            }else{
              Fluttertoast.showToast(msg: "PAYMENT FAILED", timeInSecForIosWeb: 5);
            }

          },
        ),
      ),
    );
  }
}
