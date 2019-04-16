import 'package:flutter/material.dart';

// Main method to run the app itself
void main() {
  var myApp = MyApp();
    // Return with the app Session
    return runApp(myApp);
}

class MyApp extends StatelessWidget {
  // This widget is the main menu of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Game',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Project Magic Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              child: new InkWell(
                splashColor: Colors.deepOrange,
                onTap: () {
                  print("tapped");
                },
                child: new Container(
                  width: 200.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      // After adding asset to pubspec.yaml it simply works adding the path
                      image: AssetImage("assets/images/play_singleplayer.jpg"),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Text(
                    "PLAY OFFLINE",
                    textAlign: TextAlign.right,
                  ),
                ),
               
              ),          
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openSettings,
            tooltip: 'Setting',
            child: Icon(Icons.settings),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
          }
          void _openSettings() {
          }
}
