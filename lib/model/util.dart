import 'package:connectivity/connectivity.dart';

class Utils{

  static var UID;
  static Constants constants = Constants();

  // DISH TAGS
  static const DISH_TAG_PANEER = "paneer";
  static const DISH_TAG_TANDOOR = "tandoor";
  static const DISH_TAG_VEG = "vegetarian";
  static const DISH_TAG_BURGER = "burger";
  static const DISH_TAG_FASTFOOD = "fast food";

  // RESTAURANT CATEGORIES
  static const RESTAURANT_CATEGORY_VEG = "veg";
  static const RESTAURANT_CATEGORY_NONVEG = "non veg";
  static const RESTAURANT_CATEGORY_CHINESE = "chinese";
  static const RESTAURANT_CATEGORY_NORTH = "north indian";
  static const RESTAURANT_CATEGORY_SOUTH = "south indian";
  static const RESTAURANT_CATEGORY_ITALIAN = "italian";

  // RESTAURANT TAGS
  static const RESTAURANT_TAG_TOP5 = "top 5";
  static const RESTAURANT_TAG_TRENDING = "trending";
  static const RESTAURANT_TAG_FAVOURITES = "favourites";

  // COLLECTIONS
  static const USERS_COLLECTION = "users";
  static const RESTAURANT_COLLECTION = "restaurants";
  static const DISH_COLLECTION = "dishes";
  static const CART_COLLECTION = "cart";
  static const ORDER_COLLECTION = "orders";

  static Future<bool> checkInternetConnection() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }

}

class Constants{
  final String USERS_COLLECTION = "users";
}