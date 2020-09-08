import 'package:gw2020f1/model/dish.dart';

class Orders{

  // Attributes
  String documentID; // represents the HashCode of the document created in the Firebase
  String userID;
  String restaurantID;
  DateTime orderDateTime;
  int totalPrice=0;
  List<Dish> dishes;

  Orders();
  Orders.init({this.userID, this.restaurantID, this.orderDateTime, this.totalPrice, this.dishes});
  Orders.initFromFirebase({this.userID, this.restaurantID, this.orderDateTime, this.totalPrice, this.dishes, this.documentID});

  // we need map if we wish to save or update document in Firebase
  Map<String, dynamic> toMap(){
    return {
      'userID': this.userID,
      'restaurantID': this.restaurantID,
      'orderDateTime': this.orderDateTime,
      'totalPrice': this.totalPrice,
      'dishes': this.dishes
    };
  }
}