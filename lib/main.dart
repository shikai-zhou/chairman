import 'package:flutter/material.dart';

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
      body: new TabBarView(children: <Widget>[
        ListView(
          children: <Widget>[
            ListTile(
              title: Text('Central Library'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                  );

              },
            ),
            ListTile(
              title: Text('Science Library'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdRoute())
                  );
              }
            ),
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
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
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