import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GameApp extends StatelessWidget {
  // This widget is the main menu of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic Game in action',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Game(title: 'Select a spell'),
    );    
  }
}

class Game extends StatefulWidget {
  Game({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _GameState createState() => _GameState();
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
    int points = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new FloatingActionButton(
              onPressed: () {
                print("Earth!");
                MagicTheme magicThemeA = new MagicTheme(0, "Elementary", 4);
                int s= Spells.generateRandomSpell(magicThemeA);
                if (Spells.playerWins(new Spell(2, "Earth"), Spells.spellArray(magicThemeA)[s])== 1) {
                  points++;
                  Fluttertoast.showToast(
                    msg: "Earth wins " + Spells.spellArray(magicThemeA)[s].getSpellName() + ". Points: " + points.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }else if (Spells.playerWins(new Spell(2, "Earth"), Spells.spellArray(magicThemeA)[s]) == 2) {
                  Fluttertoast.showToast(
                    msg: "Earth ties with " + Spells.spellArray(magicThemeA)[s].getSpellName() + ". Points: " + points.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }else {
                  points--;
                  Fluttertoast.showToast(
                    msg: "Earth loses to " + Spells.spellArray(magicThemeA)[s].getSpellName() + ". Points: " + points.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              },
              child: new ConstrainedBox(
                constraints: new BoxConstraints.expand(),
                child: new Image.asset("assets/images/earth.jpg", fit: BoxFit.scaleDown, gaplessPlayback: true),
              ),
            ),
            new FloatingActionButton(
              onPressed: () {
                MagicTheme magicThemeA = new MagicTheme(0, "Elementary", 4);
                int s= Spells.generateRandomSpell(magicThemeA);
                if (Spells.playerWins(new Spell(1, "Water"), Spells.spellArray(magicThemeA)[s])== 1) {
                  points++;
                  Fluttertoast.showToast(
                    msg: "Water wins " + Spells.spellArray(magicThemeA)[s].getSpellName() + ". Points: " + points.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }else if (Spells.playerWins(new Spell(1, "Water"), Spells.spellArray(magicThemeA)[s]) == 2) {
                  Fluttertoast.showToast(
                    msg: "Water ties with " + Spells.spellArray(magicThemeA)[s].getSpellName() + ". Points: " + points.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }else {
                  points--;
                  Fluttertoast.showToast(
                    msg: "Water loses to " + Spells.spellArray(magicThemeA)[s].getSpellName() + ". Points: " + points.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              },
              child: new ConstrainedBox(
                constraints: new BoxConstraints.expand(),
                child: new Image.asset("assets/images/water.jpg", fit: BoxFit.scaleDown, gaplessPlayback: true),
              ),
            ),
          ]
      )
    ));
  }
}

// OO functional part of the game

class MagicTheme{
  int identifier;
  String themeName;
  int maxSpellCount;
  
  MagicTheme(int id, String n, int max){
    identifier = id;
    themeName = n;
    maxSpellCount = max;
  }

  int getIdentifier() {
    return this.identifier;
  }

  String getThemeName() {
    return this.themeName;
  }

  int max() {
    return this.maxSpellCount;
  }
}
class MagicThemes {
  static List<MagicTheme> themeArray() {
    List<MagicTheme> magicThemes = new List(1) ;
    magicThemes[0] = new MagicTheme(0, "Elementary", 4);
    return magicThemes; 
  }
}

class Spell{
  int identifier;
  String spellName;

  Spell(int i, String sN) {
    identifier = i;
    spellName = sN;
  }

  int getIdentifier() {
    return this.identifier;
  }

  String getSpellName() {
    return this.spellName;
  }

}

class Spells {

 static List<Spell> spellArray(MagicTheme magicTheme) {
    List<Spell> spells = new List(magicTheme.maxSpellCount) ;
    if (magicTheme.themeName == "Elementary") {
      spells[0] = new Spell (0, "Fire");
      spells[1] = new Spell (1, "Water");
      spells[2] = new Spell (2, "Earth");
      spells[3] = new Spell (3, "Air");
    }else {
      spells = null;
    }
    return spells; 
  }
  
  static int playerWins(Spell playerSpell, Spell machineSpell) {
    int wins;
    if (playerSpell.getSpellName() == "Water") {
      if (machineSpell.getSpellName() == "Fire") {
        wins = 1;
      }else if (playerSpell.getSpellName() == machineSpell.getSpellName() || machineSpell.getSpellName() == "Earth") {
        wins = 2;
      }else {
        wins = 0;
      }
    }else if (playerSpell.getSpellName() == "Earth") {
      if (machineSpell.getSpellName() == "Air") {
        wins = 1;
      }else if (playerSpell.getSpellName() == machineSpell.getSpellName() || machineSpell.getSpellName() == "Water") {
        wins = 2;
      }else {
        wins = 0;
      }
    }else {
      wins = 2;
    }
    return wins;
  }

  static int generateRandomSpell(MagicTheme mT) {
    Random r = new Random.secure();
    int i= r.nextInt(mT.max());
    print(i);
    return i;
  }
}