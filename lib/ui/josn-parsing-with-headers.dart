import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'dart:async';
import 'dart:io';

// http.Client will be used to send the network request
// async -> execute the function in the background as a thread. it runs parallel to the UI
//Future<String> fetchNews(http.Client client) async{
Future<String> fetchCuisines(http.Client client) async{

  final apiKey = "put-your-key-here";
  final url = "https://developers.zomato.com/api/v2.1/cuisines?city_id=20";
  // await -> do not execute the function below till time we do not get the data from http client request
  final response = await client.get(url,
    headers: {
        //HttpHeaders.authorizationHeader: apiKey
        "user-key":apiKey
      }
  );

  // Here, compute function will execute parseNews function in the background as an ISOLATE
  return compute(parseCuisines, response.body); //response.body -> will be our JSON Data
}

//String parseNews(String responseBody){
String parseCuisines(String responseBody){

  // Here jsonData represents Map Data Structure in Dart
  Map<String, dynamic> jsonData = jsonDecode(responseBody);

  // Parse the data here

  return jsonData.toString();
}

// OOPS
class Cuisine{


}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Zomato App",
        home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zomato App"),
      ),
      //body: FutureBuilder<String>(
      body: FutureBuilder<String>(
        future: fetchCuisines(http.Client()),
        builder: (context, snapshot) {
          if(snapshot.hasError) print("Some Error ${snapshot.error}");
          return snapshot.hasData ? Center(child: Text(snapshot.data)) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}