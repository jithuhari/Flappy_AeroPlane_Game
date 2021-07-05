import 'dart:async';
import 'package:flappy_bird_game/Screens/barriers.dart';
import 'package:flappy_bird_game/Screens/plane.dart';
import 'package:flutter/material.dart';

class MYHomePage extends StatefulWidget {
  const MYHomePage({Key? key}) : super(key: key);

  @override
  _MYHomePageState createState() => _MYHomePageState();
}

class _MYHomePageState extends State<MYHomePage> {
  static double planeYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = planeYaxis;
  bool gamehasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = planeYaxis;
    });
  }

  void startGame() {
    gamehasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.04;
      //Height Equation =( y = -4.9t^2 + 5t );
      height = -4.9 * time * time + 2.8 * time;

      setState(() {
        planeYaxis = initialHeight - height;
      });

      if (planeYaxis > 1) {
        timer.cancel();
        gamehasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (gamehasStarted) {
                    jump();
                  } else {
                    startGame();
                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment(0, planeYaxis),
                  duration: Duration(milliseconds: 0),
                  child: PlaneImage(),
                  color: Colors.blue,
                ),
              ),
              Container(
                  alignment: Alignment(
                    0,
                    -0.3,
                  ),
                  child: gamehasStarted
                      ? Text('')
                      : Text(
                          'Tap To Play',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(0, 1.1),
                child: MyBarriers(
                  size: MediaQuery.of(context).size.height * .25,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(0, -1.1),
                child: MyBarriers(
                  size: MediaQuery.of(context).size.height * .2,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(.9, 1.1),
                child: MyBarriers(
                  size: MediaQuery.of(context).size.height * .2,
                ),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 0),
                alignment: Alignment(.9, -1.1),
                child: MyBarriers(
                  size: MediaQuery.of(context).size.height * .3,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Curent Score',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '0',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Best Score',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '10',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
