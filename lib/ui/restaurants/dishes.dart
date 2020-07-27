import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gw2020f1/model/util.dart';

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;

class DishesPage extends StatelessWidget{

  String restauranName;
  String restaurantId;

  DishesPage({Key key, @required this.restauranName, @required this.restaurantId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    CollectionReference restaurants = db.collection(Utils.RESTAURANT_COLLECTION)
        .document(restaurantId)
        .collection(Utils.DISH_COLLECTION);

    return Scaffold(

      appBar: AppBar(
        title: Text(restauranName),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: restaurants.snapshots(),
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
            children: snapshot.data.documents.map((DocumentSnapshot document){
              /*return ListTile(
                title: Text(document.data['name']),
                subtitle: Text(document.data['phone']),
              );*/

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
                    RaisedButton(
                      child: Text("ADD TO CART"),
                      onPressed: (){
                        // code yet
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