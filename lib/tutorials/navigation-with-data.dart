import 'package:flutter/material.dart';


class CovidCases{

  int active;
  int confirmed;
  int deaths;
  String state;
  String notes;

  CovidCases(this.active, this.confirmed, this.deaths, this.state, this.notes);

}

Widget createDynamicCovidListView(BuildContext context){

  /*
  CovidCases c1 = CovidCases(63342, 147741, 6931, "Maharashtra", "15 cases were marked as non-covid deaths in MH bulletin");
  CovidCases c2 = CovidCases(30067, 70977, 911, "Tamil Nadu", "2 deaths cross notified to other states from Chennai and Coimbatore";
  CovidCases c3 = CovidCases(26586, 73780, 2429, "Delhi", "Delhi bulletins in the morning, containing data of the previous day");
  CovidCases c4 = CovidCases(6318, 29578, 1754, "Gujarat", "No Notes Available");
  CovidCases c5 = CovidCases(1457, 4769, 120, "Punjab", "No Notes Available");

  var covidStates = <CovidCases>[c1, c2, c3, c4, c5];
  */

  // Data is Hard-Coded
  var covidStates = <CovidCases>[
    CovidCases(63342, 147741, 6931, "Maharashtra", "15 cases were marked as non-covid deaths in MH bulletin"),
    CovidCases(30067, 70977, 911, "Tamil Nadu", "2 deaths cross notified to other states from Chennai and Coimbatore"),
    CovidCases(26586, 73780, 2429, "Delhi", "Delhi bulletins in the morning, containing data of the previous day"),
    CovidCases(6318, 29578, 1754, "Gujarat", "No Notes Available"),
    CovidCases(1457, 4769, 120, "Punjab", "No Notes Available")
  ];

  return ListView.separated(
    itemCount: covidStates.length,
    itemBuilder: (context, index) { // index will begin from 0 till news.length
      return
        Card(
          child: ListTile(
          leading: Icon(Icons.healing),
          title: Text(covidStates[index].state, style: TextStyle(color: Colors.orange, fontSize: 20.0),),
          subtitle: Text("Confirmed: ${covidStates[index].confirmed}", style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){
            Navigator.push(   // startActivity()
                context,
                MaterialPageRoute( // Intent
                    builder: (context) => StateDescriptionWidget(cases:covidStates[index])
                )
            );
          },
      )
        );
    },
    separatorBuilder: (context, index) {
      return Divider(
        color: Colors.grey,
      );
    },
  );

}


class NavDataApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyNavApp",
      home:  Scaffold(
        appBar: AppBar(
            title: Text("Covid Cases India")
        ),
        body: HomeWidget(),
      )

      /*
      // industrial standard
      routes: { // Map or Dictionary i.e. Key Value Pair :)
        '/': (context) => HomeWidget(),
        '/dashboard': (context) => DashBoardWidget(),
      },
      initialRoute: '/',*/
    );
  }
}

class HomeWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return createDynamicCovidListView(context);
  }

}

class StateDescriptionWidget extends StatelessWidget{

  CovidCases cases;

  StateDescriptionWidget({Key key, @required this.cases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Cases | ${cases.state}"),
      ),
      body: Center(
        child: Text(
            "Covid Cases\nActive: ${cases.active}\nConformed: ${cases.confirmed}\nDeaths: ${cases.deaths}\nNotes: ${cases.notes}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orangeAccent, fontSize: 16.0,
        )
      )
      )
    );
  }

}