import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gw2020f1/model/util.dart';
import 'package:gw2020f1/ui/restaurants/dishes.dart';

// Firestore is reference to Cloud Firestore DataBase Module of our Firebase Project
final Firestore db = Firestore.instance;

class RestaurantsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    CollectionReference restaurants = db.collection(Utils.RESTAURANT_COLLECTION);

    return Scaffold(
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
            padding: EdgeInsets.all(16.0),
            children: snapshot.data.documents.map((DocumentSnapshot document){
              /*return ListTile(
                title: Text(document.data['name']),
                subtitle: Text(document.data['phone']),
              );*/

              return
                GestureDetector(
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Image.network(document.data['imageURL']),
                          SizedBox(height: 2.0,),
                          Text(document.data['name'], style: TextStyle(fontSize: 24.0, color: Colors.amber),),
                          Divider(),
                          Text(document.data['phone'], style: TextStyle(fontSize: 14.0, color: Colors.black),),
                          Text(document.data['email'], style: TextStyle(fontSize: 14.0, color: Colors.black),),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DishesPage(restauranName: document.data['name'], restaurantId:document.documentID),
                        )
                    );
                  },
                );

            }).toList(),
          );
        },
      ),
    );

  }
}