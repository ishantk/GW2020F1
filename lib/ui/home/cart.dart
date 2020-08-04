import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:gw2020f1/ui/order/place-order.dart';
import 'package:gw2020f1/ui/widgets/counter.dart';
import 'package:gw2020f1/model/util.dart';

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class ShoppingCartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){

    CollectionReference cart = db.collection(Utils.USERS_COLLECTION)
        .document(Utils.UID)
        .collection(Utils.CART_COLLECTION);

    return Scaffold(

      appBar: AppBar(
        title: Text("CART"),
        actions: [
            IconButton(
              icon: const Icon(Icons.credit_card),
              tooltip: 'Order',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          return PlaceOrderPage();
                        }
                    )
                );
              },
            )
          ]
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: cart.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if(snapshot.hasError){
            return Center(
              child: Text("Something Went Wrong. Please Try Again"),
            );
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text("Please Wait..."),
            );
          }

          // Presentation of All the Restaurants in the DataBase in restaurants collection
          return ListView(
            padding: EdgeInsets.all(16.0),
            children: snapshot.data.documents.map((DocumentSnapshot document){
              return Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.network(document.data['imageUrl']),
                    SizedBox(height: 2.0,),
                    Text(document.data['name'], style: TextStyle(fontSize: 24.0, color: Colors.amber),),
                    Divider(),
                    Text(document.data['description'], style: TextStyle(fontSize: 16.0, color: Colors.black),),
                    Text(document.data['price'].toString(), style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),),
                    Divider(),
                    CounterWidget(dishDocumentId: document.documentID, dishPrice: document.data['price']),
                    RaisedButton(
                      child: Text("REMOVE"),
                      onPressed: (){
                        cart.document(document.documentID).delete()
                            .then((value) => print("Dish Deleted Successfully"))
                            .catchError((error) => print("Some Error Occurred while Updating the User $error"));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.amber)
                      ),
                      color: Colors.white,
                    )
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