import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/model/Person.dart';
import 'package:gw2020f1/ui/persondetails.dart';



class MyNavAppWithData extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NavigationApp",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{

  _LoginPageState createState() => _LoginPageState();
}

// Widget shall be build in the State instead of the above class :)
class _LoginPageState extends State<LoginPage>{

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  Person person = Person("NA", "NA");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0), // padding vs margin
            children: <Widget>[
              SizedBox(height: 80.0,), // A box with a specified size as in the height
              Column(
                children: <Widget>[
                  Image.asset('assets/ic_login.png'),
                  SizedBox(height: 16.0,),
                  Text("Enter Your Details")
                ],
              ),
              SizedBox(height: 100.0,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    //fillColor: Colors.cyan,
                    labelText: 'Enter Your Name'
                ),
                controller: controllerName,
              ),
              SizedBox(height: 16.0,),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter Your Email',
                ),
                controller: controllerEmail,
              ),
              SizedBox(height: 16.0,),
              ButtonBar(
                children: [
                  RaisedButton(
                    child: Text("SUBMIT"),
                    onPressed: (){

                      // Read the Data from UI and store it in the Object.
                      person.name = controllerName.text;
                      person.email = controllerEmail.text;

                      Navigator.push(   // startActivity()
                          context,
                          MaterialPageRoute( // Intent
                              builder: (context) => PersonDescriptionWidget(person:person)
                          )
                      );

                        /*return showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Person Details: "),
                                //content: Text("Your Details:\n"+controllerName.text+"\n"+controllerEmail.text),
                                content: Text("Your Details:\n"+person.name+"\n"+person.email),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Done"),
                                    onPressed: (){
                                      Navigator.of(context).pop(); // Dismiss the Dialog i.e. remove from memory itself
                                    },
                                  )
                                ],
                              );
                            }
                        );*/
                    },
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}