import 'dart:async';
import 'package:flutter/material.dart';
import 'package:chairman/database_helper.dart';
import 'package:chairman/mysqldb.dart';
void main() => runApp(MyApp());

// Model class for seat
class Seat {
  int id;
  int isFree;
  int hasPort;

  Seat({this.id, this.isFree, this.hasPort});
}

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Chairman',
      home: StartWidget(),
    );
  }
  // #enddocregion build
}
// #enddocregion MyApp

// #docregion RWS-var
class StartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: 3,
        child : new Scaffold(
      appBar: AppBar(
        title: Text('The Chairman'),
        
        bottom: new TabBar(tabs: <Widget>[
          new Tab(text: "Libraries"),
          new Tab(text: "Cafes"),
          new Tab(text: "Open Spaces")
          ],
        ), 
      ),
      body: new TabBarView(
        children: <Widget>[
        ListView(
          children: <Widget>[
            ListTile(
              title: Text('Central Library'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CenLibRoute()),
                  );
              },
            ),
            ListTile(
              title: Text('Science Library'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SciLibRoute())
                  );
              }
            ),
            ListTile(
              title: Text('Business Library'),
              onTap: () {

              }
            ),
            ListTile(
              title: Text('Medicine Library'),
              onTap: () {}
            ),
            ListTile(
              title: Text('Law Library'),
              onTap: () {}
            )
         ],
        ),
        new Text ("Coming Soon"),
        new Text ("Coming Soon"),
      ])
      )

      )

    );
  }
}

//These are the navigation pages for the libraries
class CenLibRoute extends StatelessWidget {

final dbHelper = DatabaseHelper.instance;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Central Library"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DisplayFree(),
          MyCustomForm(),
          Center(
          child: RaisedButton(
            onPressed: () {

              dbHelper.deleteall();
              dbHelper.insert100();
              
            },
            child: Text('Reset'),
            ),
            
          ),
          new Image.asset("assets/images/Central_L1_floorplan.jpg"),
          //new Image.asset("assets/images/Central_L2_floorplan.jpg"),
        ],
      )
    );
    
  }

}
class DisplayFree extends StatelessWidget{
  /*
  @override
  _DisplayFreeState createState() {
    return _DisplayFreeState();
  }
}
//display the number of free seats
class _DisplayFreeState extends State<DisplayFree> {
*/
  final dbHelper = DatabaseHelper.instance;

  //count the number of empty seats
  Future<int> _count() async{
    var ans = 0;
    var count = await dbHelper.queryRowCount();
    List<Seat> records = await seats();
    for (var i = 0; i < count; i++) {
      if (records[i].isFree == 1) {
        ans++;
      }
    }
    return ans;
  }
  Future<List<Seat>> seats() async {


  // Query the table for all The Dogs.
  final List<Map<String, dynamic>> maps = await dbHelper.queryAllRows();
  // Convert the List<Map<String, dynamic> into a List<Dog>.
  return List.generate(maps.length, (i) {
    return Seat(
      id: maps[i]['_id'],
      isFree: maps[i]['isFree'],
      hasPort: maps[i]['hasPort'],
    );
  });
}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<int>(
        future: _count(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Text('${snapshot.data} /100 seats free', style: TextStyle(fontSize: 24));
        },
      )
    );
  }

}


class SciLibRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Library'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Check in'),
        ),
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  int choice = 1;
  int _seatstaken = 0;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
              // Add TextFormFields and RaisedButton here.
              TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Enter your seat number',
                ),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (String value) {
               print('Value for field saved as "$value"');
               choice = int.tryParse(value);
              }
          ),
    Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: RaisedButton(
            onPressed: () {
              //update database
              if(_formKey.currentState.validate()) {

              Scaffold
                 .of(context)
                 .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
              choice = int.tryParse(myController.text);
              if (choice == null) {choice = 1;}
              _update1(choice);
              setState(() {
                _seatstaken++;
              }); //changes state for widget to rebuild
              WidgetsBinding.instance.addPostFrameCallback(
              (_) => myController.clear());
            },
            child: Text('Check in'),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: RaisedButton(
            onPressed: () {
              //update database
              if(_formKey.currentState.validate()) {

              Scaffold
                 .of(context)
                 .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
              choice = int.tryParse(myController.text);
              if (choice == null) {choice = 1;}
              //_update();
              _update2(choice);
              setState(() {
                _seatstaken--;
              });//changes state for widget to rebuild
            },
            child: Text('Check out'),
            ),
          )
        ]
     )
    );
  }
  void _update1(int choice) async {
  // row to update
  Map<String, dynamic> row = {
    DatabaseHelper.columnId   : choice,  
    DatabaseHelper.columnFree : 0,
    DatabaseHelper.columnChargingPort : 1
  };
  final rowsAffected = await dbHelper.update(row);
  print('updated $rowsAffected row(s)');
  }
  void _update2(int choice) async {
  // row to update
  Map<String, dynamic> row = {
    DatabaseHelper.columnId   : choice,  
    DatabaseHelper.columnFree : 1,
    DatabaseHelper.columnChargingPort : 1
  };
  final rowsAffected = await dbHelper.update(row);
  print('updated $rowsAffected row(s)');
  }
}
  // #enddocregion RWS-var


  // #docregion RWS-build


// #enddocregion RWS-var