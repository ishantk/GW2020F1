import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



import 'package:flutter_counter/flutter_counter.dart';
import 'package:gw2020f1/tutorials/google-maps.dart';
import 'package:gw2020f1/ui/navigation-with-animation.dart';
import 'package:gw2020f1/ui/profile/capture-image.dart';
import 'package:gw2020f1/ui/profile/manage-addresses.dart';
import 'package:gw2020f1/ui/profile/user-profile.dart';
import 'package:gw2020f1/ui/widgets/counter.dart';
import 'package:gw2020f1/gne/test-widget.dart';
//import 'home.dart';
//import 'login.dart';
//import 'app.dart';
//import 'bar.dart';
//import 'apptheme.dart';
//import 'sanckbarapp.dart';
//import 'scaffoldui.dart';
//import 'bottomnav.dart';
//import 'appbarwithaction.dart';
//import 'listview.dart';

//import 'navigation.dart';
//import 'navigation-with-data.dart';

//import 'navigation-with-textfields.dart';
//import 'package:gw2020f1/ui/order.dart';
//import 'package:gw2020f1/ui/tabcontroller.dart';
//import 'package:gw2020f1/ui/navigationdrawer.dart'

//import 'package:gw2020f1/app/materialapp.dart';

//import 'package:gw2020f1/ui/rowcolumn.dart';
//import 'package:gw2020f1/ui/container.dart';
//import 'package:gw2020f1/ui/grid-and-list.dart';
//import 'package:gw2020f1/ui/card-widget.dart';

//import 'package:gw2020f1/ui/stack.dart';
//import 'package:gw2020f1/ui/json-parsing.dart';
//import 'package:gw2020f1/ui/josn-parsing-with-headers.dart';
//import 'package:gw2020f1/ui/navigation-with-animation.dart';

//import 'package:gw2020f1/ui/gesture-detector.dart';

//import 'package:gw2020f1/ui/inkwell.dart';
// runApp function should take Object as Input which should be a widget returning MaterialApp Widget
//void main() => runApp(NavDataApp());

//import 'package:gw2020f1/fooddeliveryapp/app.dart';

//import 'package:gw2020f1/gne/gne-app.dart';

//import 'package:gw2020f1/cloudfirestore/firestore-operations.dart';


//import 'package:gw2020f1/fooddeliveryapp/register.dart';

import 'package:gw2020f1/ui/auth/splash.dart';
import 'package:gw2020f1/ui/restaurants/restaurants.dart';

const String appName = "GW2020F1 - Food Delivery";

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: MapSample(),
      routes: {
        "/capture": (context) => CaptureImageFromCamera(),
        "/user-profile": (context) => UserProfile(),
        "/manage-address": (context) => AddressPage(),
        "/manage-profile": (context) => ProfilePage(),
      },
    );
  }
}

void main(){

  // In Released Mode, If any error occurs, app will close
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      exit(1);
    }
  };

  runApp(MyApp());

}
