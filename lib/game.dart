import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Game extends StatefulWidget {
  Game({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _GameState createState() => _GameState();
}

class JKPOChoser {
    var magicTypes = String();

}

class Magic{
  
  int identifier;
  String friendlyName;

  Magic();

}

class _GameState extends State<Game> {
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