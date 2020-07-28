import 'package:flutter/material.dart';
import 'package:gw2020f1/model/util.dart';
import 'package:gw2020f1/ui/home/cart.dart';
import 'package:gw2020f1/ui/home/sliders.dart';
import 'package:gw2020f1/ui/restaurants/restaurants.dart';

class HomePageWithFilters extends StatefulWidget{
  @override
  HomePageWithFiltersState createState() {
    return HomePageWithFiltersState();
  }
}

class HomePageWithFiltersState extends State<HomePageWithFilters>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              tooltip: 'Cart',
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context){
                          //Restaurant restaurant = Restaurant.init();
                          return ShoppingCartPage();
                        }
                    )
                );
              },
            )
          ]
      ),
//      body: SingleChildScrollView(
//        scrollDirection: Axis.vertical,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: 80.0,// For showing Filters
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
                    onPressed: (){

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
                    onPressed: (){

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
                    onPressed: (){

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
                    onPressed: (){

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
                    onPressed: (){

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
                    onPressed: (){

                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 4.0,),
            HomePageSlider(),
            SizedBox(height: 4.0,),
            Expanded( // For showing Restaurants
              child: RestaurantsPage(),
            ),
          ],
        )
//      )
    );

  }
}