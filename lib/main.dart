import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

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
            ),
            ListTile(
              title: Text('Medicine Library')
            ),
            ListTile(
              title: Text('Law Library')
            )
         ],
        ),
        new Text ("Second widget"),
        new Text ("Third widget"),
      ])
      )

      )

    );
  }
}
//TODO: implement library page interface
//These are the navigation pages for the libraries
class CenLibRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Central Library"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('100/100 seats free', style: TextStyle(fontSize: 24)),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your seat number',
            ),
            validator: (String value) {
              if(value.isEmpty) {
                return 'Please enter a seat number';
              }
              return null;
            },
          ),
          Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
              //if (_formKey.currentState.validate()) {
                // Process data.
              //}
            },
            child: Text('Check in/ Check out'),
            ),
          )
        ],
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
  // #enddocregion RWS-var


  // #docregion RWS-build
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }*/
  // #enddocregion RWS-build
  // #docregion RWS-var


// #enddocregion RWS-var