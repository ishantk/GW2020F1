import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';

// http.Client will be used to send the network request
// async -> execute the function in the background as a thread. it runs parallel to the UI
//Future<String> fetchNews(http.Client client) async{
Future<List<News>> fetchNews(http.Client client) async{

  final url = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=31c21508fad64116acd229c10ac11e84";
  // await -> do not execute the function below till time we do not get the data from http client request
  final response = await client.get(url);

  // Here, compute function will execute parseNews function in the background as an ISOLATE
  return compute(parseNews, response.body); //response.body -> will be our JSON Data
}

//String parseNews(String responseBody){
List<News> parseNews(String responseBody){

  // Here jsonData represents Map Data Structure in Dart
  Map<String, dynamic> jsonData = jsonDecode(responseBody);
  // Fetch all the articles as List of JSONs from the jsonData
  List newsList = jsonData['articles'];

  // Map returned back as String
  //return jsonData.toString();

  /* Rather than writing this loop and creating a List of News Objects, we have written a map function below
  List news = [];
  for(int i=0;i<newsList.length;i++){
    var article = newsList[i];
    News n = News.fromJson(article);
    news.add(n);
  }*/

  // Mapping of Single Article as a news object and putting it into a List
  // map function which reads list of articles and map them to News Object
  return newsList.map<News>((json) => News.fromJson(json)).toList();

}

// OOPS
class News{

  String title;
  String author;
  String urlToImage;
  String publishedAt;
  String description;
  String url;

  News({this.title, this.author, this.urlToImage, this.publishedAt, this.description, this.url});

  // In Dart, factory named constructor is the one which will use other constructor to create and return back an object
  factory News.fromJson(Map<String, dynamic> json){
    // returning back a news object constructed from json
    return News(
      title: json['title'],
      author: json['author'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      description: json['description'],
      url: json['url'],
    );
  }

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News App",
      home: HomePage()
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      //body: FutureBuilder<String>(
      body: FutureBuilder<List<News>>(
        future: fetchNews(http.Client()),
        builder: (context, snapshot) {
          if(snapshot.hasError) print("Some Error ${snapshot.error}");
          //return snapshot.hasData ? Center(child: Text(snapshot.data)) : Center(child: CircularProgressIndicator());
          return snapshot.hasData ? NewsList(news: snapshot.data) : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class NewsList extends StatelessWidget{

  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: news.length,
      itemBuilder: (context, index) { // index will begin from 0 till news.length
        return GestureDetector(
          child: Card(
            margin: EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(news[index].urlToImage),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 10,),
                  Text(news[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  Text(news[index].author, style:TextStyle(fontSize: 18),)
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(   // startActivity()
                context,
                MaterialPageRoute( // Intent
                    builder: (context) => NewsPage(url: news[index].url)
                )
            );
          },
        );

      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.amber,
        );
      },
    );
  }
}

class NewsPage extends StatelessWidget{

  final String url;

  NewsPage({Key key, this.url}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("News Page"),
    ),
    //body: FutureBuilder<String>(
    body: WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    )
    );
  }
}

// Assignment: JSON Parsing for COVID19 India App : https://api.covid19india.org/data.json