import 'package:gradient_text/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:tic_tac_toe/ui/game_Interface.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: GradientText(
            "Tic Tac Toe",
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.pink, Colors.deepOrange, Colors.pink]),
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlareActor(
                'assets/hash.flr',
                alignment: Alignment.center,
                animation: "Hashpost Logo Animation",
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: ButtonTheme(
                minWidth: 200,
                height: 80,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  color: Colors.black,
                  child: GradientText(
                    "Comienzo!",
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pink, Colors.deepOrange, Colors.pink]),
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                game_Interface(widget.title)));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
