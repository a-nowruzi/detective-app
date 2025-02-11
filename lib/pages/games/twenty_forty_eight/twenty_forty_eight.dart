import 'package:detective/shared/app_bar.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'grid.dart';
import 'logic.dart';
import 'tile.dart';

class TwentyFortyEight extends StatefulWidget {
  const TwentyFortyEight({super.key});

  @override
  State<TwentyFortyEight> createState() => _TwentyFortyEightState();
}

class _TwentyFortyEightState extends State<TwentyFortyEight> {
  List<List<int>> grid = [];
  List<List<int>> gridNew = [];
  int score = 0;
  bool isgameOver = false;
  bool isgameWon = false;

  List<Widget> getGrid(double width, double height) {
    List<Widget> grids = [];
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        int num = grid[i][j];
        String number;
        int color;
        if (num == 0) {
          color = MyColor.emptyGridBackground;
          number = "";
        } else if (num == 2 || num == 4) {
          color = MyColor.gridColorTwoFour;
          number = "$num";
        } else if (num == 8 || num == 64 || num == 256) {
          color = MyColor.gridColorEightSixtyFourTwoFiftySix;
          number = "$num";
        } else if (num == 16 || num == 32 || num == 1024) {
          color = MyColor.gridColorSixteenThirtyTwoOneZeroTwoFour;
          number = "$num";
        } else if (num == 128 || num == 512) {
          color = MyColor.gridColorOneTwentyEightFiveOneTwo;
          number = "$num";
        } else {
          color = MyColor.gridColorWin;
          number = "$num";
        }
        double size = 50.0;
        String n = number;
        switch (n.length) {
          case 1:
          case 2:
            size = 40.0;
            break;
          case 3:
            size = 30.0;
            break;
          case 4:
            size = 20.0;
            break;
        }
        grids.add(tile(number, width, height, color, size));
      }
    }
    return grids;
  }

  void handleGesture(int direction) {
    /*

      0 = up
      1 = down
      2 = left
      3 = right

    */
    bool flipped = false;
    bool played = true;
    bool rotated = false;
    if (direction == 0) {
      setState(() {
        grid = transposeGrid(grid);
        grid = flipGrid(grid);
        rotated = true;
        flipped = true;
      });
    } else if (direction == 1) {
      setState(() {
        grid = transposeGrid(grid);
        rotated = true;
      });
    } else if (direction == 2) {
    } else if (direction == 3) {
      setState(() {
        grid = flipGrid(grid);
        flipped = true;
      });
    } else {
      played = false;
    }

    if (played) {
      // print('playing');
      List<List<int>> past = copyGrid(grid);
      // print('past $past');
      for (int i = 0; i < 4; i++) {
        setState(() {
          List result = operate(grid[i], score);
          score = result[0];
          // print('score in set state $score');
          grid[i] = result[1];
        });
      }
      setState(() {
        grid = addNumber(grid, gridNew);
      });
      bool changed = compare(past, grid);
      // print('changed $changed');
      if (flipped) {
        setState(() {
          grid = flipGrid(grid);
        });
      }

      if (rotated) {
        setState(() {
          grid = transposeGrid(grid);
        });
      }

      if (changed) {
        setState(() {
          grid = addNumber(grid, gridNew);
          // print('is changed');
        });
      } else {
        // print('not changed');
      }

      bool gameover = isGameOver(grid);
      if (gameover) {
        // print('game over');
        setState(() {
          isgameOver = true;
        });
      }

      bool gamewon = isGameWon(grid);
      if (gamewon) {
        // print("GAME WON");
        setState(() {
          isgameWon = true;
        });
      }
      // print(grid);
      // print(score);
    }
  }

  @override
  void initState() {
    grid = blankGrid();
    gridNew = blankGrid();
    addNumber(grid, gridNew);
    addNumber(grid, gridNew);
    super.initState();
  }

  Future<String> getHighScore() async {
    int score = 0;
    return score.toString();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double gridWidth = (width - 80) / 4;
    double gridHeight = gridWidth;
    double height = 30 + (gridHeight * 4) + 40;

    return Scaffold(
        appBar: Header.appBar('2048'),
        backgroundColor: Palette.bg,
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          width: 200,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Color(MyColor.gridBackground)),
                          height: 82,
                          child: Column(children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 10.0, bottom: 2.0),
                                child: Text('Score',
                                    style: TextStyle(fontSize: 15.0, color: Colors.white70, fontWeight: FontWeight.bold))),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text('$score',
                                    style: const TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold)))
                          ]))),
                  Container(
                      height: height,
                      color: Color(MyColor.gridBackground),
                      child: Stack(children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                                child: GridView.count(
                                    primary: false,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    crossAxisCount: 4,
                                    children: getGrid(gridWidth, gridHeight)),
                                onVerticalDragEnd: (DragEndDetails details) {
                                  //primaryVelocity -ve up +ve down
                                  if (details.primaryVelocity! < 0) {
                                    handleGesture(0);
                                  } else if (details.primaryVelocity! > 0) {
                                    handleGesture(1);
                                  }
                                },
                                onHorizontalDragEnd: (details) {
                                  //-ve right, +ve left
                                  if (details.primaryVelocity! > 0) {
                                    handleGesture(2);
                                  } else if (details.primaryVelocity! < 0) {
                                    handleGesture(3);
                                  }
                                })),
                        isgameOver
                            ? Container(
                                height: height,
                                color: Color(MyColor.transparentWhite),
                                child: Center(
                                    child: Text('Game over!',
                                        style: TextStyle(
                                            fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(MyColor.gridBackground)))))
                            : const SizedBox(),
                        isgameWon
                            ? Container(
                                height: height,
                                color: Color(MyColor.transparentWhite),
                                child: Center(
                                    child: Text('You Won!',
                                        style: TextStyle(
                                            fontSize: 30.0, fontWeight: FontWeight.bold, color: Color(MyColor.gridBackground)))))
                            : const SizedBox()
                      ])),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                        Container(
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Color(MyColor.gridBackground)),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: IconButton(
                                    iconSize: 35.0,
                                    icon: const Icon(Icons.refresh, color: Colors.white70),
                                    onPressed: () {
                                      setState(() {
                                        grid = blankGrid();
                                        gridNew = blankGrid();
                                        grid = addNumber(grid, gridNew);
                                        grid = addNumber(grid, gridNew);
                                        score = 0;
                                        isgameOver = false;
                                        isgameWon = false;
                                      });
                                    }))),
                        Container(
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Color(MyColor.gridBackground)),
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(children: <Widget>[
                                  const Text('High Score', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                                  FutureBuilder<String>(
                                      future: getHighScore(),
                                      builder: (ctx, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data ?? '',
                                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
                                        } else {
                                          return const Text('0',
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
                                        }
                                      })
                                ])))
                      ]))
                ])))));
  }
}
