import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
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
      body: new TabBarView(children: <Widget>[
        new Text ("First widget"),
        new Text ("Second widget"),
        new ListView.builder(itemBuilder: null),
      ])
      )

      )

    );
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
}
// #enddocregion RWS-var