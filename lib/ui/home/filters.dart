import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/model/util.dart';
import 'package:gw2020f1/ui/home/cart.dart';
import 'package:gw2020f1/ui/home/sliders.dart';
import 'package:gw2020f1/ui/restaurants/dishes.dart';
import 'package:gw2020f1/ui/restaurants/restaurants.dart';

final Firestore db = Firestore.instance;


class HomePageWithFilters extends StatefulWidget {
  @override
  HomePageWithFiltersState createState() {
    return HomePageWithFiltersState();
  }
}

class HomePageWithFiltersState extends State<HomePageWithFilters> {

  CollectionReference restaurants = db.collection(Utils.RESTAURANT_COLLECTION);

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(title: Text("Home Page"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              tooltip: 'Cart',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) {
                          //Restaurant restaurant = Restaurant.init();
                          return ShoppingCartPage();
                        }
                    )
                );
              },
            )
          ]
      ),
      body: */
     ListView(
        padding: EdgeInsets.all(8.0),
        scrollDirection: Axis.vertical,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            height: 80.0, // For showing Filters
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(8.0),
              children: [
                RaisedButton(
                  child: Text(
                    Utils.RESTAURANT_CATEGORY_VEG,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                Padding(padding: EdgeInsets.all(6.0),),
                RaisedButton(
                  child: Text(
                    Utils.RESTAURANT_CATEGORY_NONVEG,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                Padding(padding: EdgeInsets.all(6.0),),
                RaisedButton(
                  child: Text(
                    Utils.RESTAURANT_CATEGORY_NORTH,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                Padding(padding: EdgeInsets.all(6.0),),
                RaisedButton(
                  child: Text(
                    Utils.RESTAURANT_CATEGORY_SOUTH,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                Padding(padding: EdgeInsets.all(6.0),),
                RaisedButton(
                  child: Text(
                    Utils.RESTAURANT_CATEGORY_CHINESE,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                Padding(padding: EdgeInsets.all(6.0),),
                RaisedButton(
                  child: Text(
                    Utils.RESTAURANT_CATEGORY_ITALIAN,
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.amber)
                  ),
                  color: Colors.white,
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
          SizedBox(height: 4.0,),
          HomePageSlider(),
          SizedBox(height: 4.0,),
          StreamBuilder<QuerySnapshot>(
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
                shrinkWrap: true,
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
                                builder: (context){
                                  //Restaurant restaurant = Restaurant.init();
                                  return DishesPage(restauranName: document.data['name'], restaurantId:document.documentID);
                                }
                            )
                        );
                      },
                    );

                }).toList(),
              );
            },
          )
        ],
      );
    //);
  }
}