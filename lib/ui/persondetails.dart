import 'package:flutter/material.dart';
import 'package:gw2020f1/model/Person.dart';

class PersonDescriptionWidget extends StatelessWidget{

  Person person;

  PersonDescriptionWidget({Key key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: Center(
            child: Text(
                "Person Details\nName: ${person.name}\nEmail: ${person.email}",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orangeAccent, fontSize: 24.0,
                )
            )
        )
    );
  }

}