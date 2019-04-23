import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game.dart';

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
      home: MainMenu(title: 'Project Magic Game'),
    );
    
  }
}

class MainMenu extends StatefulWidget {
  MainMenu({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // The following method locks screen orientation to portrait
  @override
  void initState(){
    super.initState();
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
  }

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
<<<<<<< HEAD
            Material (
              elevation: 4.0,
              shape : RoundedRectangleBorder(),
              color: Colors.white,
              child : Ink.image(
                image : AssetImage("assets/images/play_singleplayer.jpg"),
                fit: BoxFit.fitHeight,
                width: 320.0,
                height : 160.00,
                child: InkWell(onTap: () {print("Tapped");},
                  child : null,
                )
              )  
            ),
            Divider(
              color: Colors.grey,
              height : 16.0
=======
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
>>>>>>> e27934026bf0b6c81b5acd9f090ffcdc38692ab6
            ),
            Material (
              elevation: 4.0,
              shape : RoundedRectangleBorder(),
              color: Colors.white,
              child : Ink.image(
                image : AssetImage("assets/images/settings.jpg"),
                fit: BoxFit.fitHeight,
                width: 320.0,
                height : 160.00,
                child: InkWell(onTap: () {print("Tapped");},
                  child : null,
                )
              )
            )
          ],
        )
      )
    );
  }
}
