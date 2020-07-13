import 'package:flutter/material.dart';
import 'package:gw2020f1/fooddeliveryapp/register-user.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Delivery App",
      home: RegisterUserUI(),
    );
  }
}