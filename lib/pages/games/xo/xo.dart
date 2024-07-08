import 'package:detective/shared/app_bar.dart';
import 'package:detective/shared/colors.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'winner.dart';

class XO extends StatefulWidget {
  const XO({super.key});

  @override
  State<XO> createState() => _XOState();
}

class _XOState extends State<XO> {
  List xoList = [
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
    'box',
  ];

  final txtPlayerO = 'o';
  final txtPlayerX = 'x';

  int playerO = 0;
  int playerX = 0;
  int equal = 0;
  int filledBoxes = 0;
  int boardSize = 3;

  bool winnerO = false;
  bool winnerX = false;
  bool isTurnO = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header.appBar('تیک تاک تو'),
        backgroundColor: Palette.bg,
        body: SafeArea(
            child: Column(children: [
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            dropDownButton(),
            GestureDetector(
                onTap: () {
                  clearGame();
                },
                child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 9, 15, 9),
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(color: kAmber, borderRadius: BorderRadius.circular(7)),
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.refresh_rounded, size: 24, color: Colors.black))))
          ]),
          const SizedBox(height: 20),
          getTurn(),
          const SizedBox(height: 20),
          getScoreBoard(),
          getGridView()
        ])));
  }

  Widget dropDownButton() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(border: Border.all(color: kBlue, width: 2), borderRadius: BorderRadius.circular(8)),
        child: DropdownButton<String>(
            items: const [
              DropdownMenuItem(
                  value: '3',
                  child: Text('3 x 3', style: TextStyle(color: kWhite, fontSize: 30, fontWeight: FontWeight.bold))),
              DropdownMenuItem(
                  value: '4',
                  child: Text('4 x 4', style: TextStyle(color: kWhite, fontSize: 30, fontWeight: FontWeight.bold)))
            ],
            onChanged: (value) {
              setState(() {
                boardSize = int.parse(value!);
              });
            },
            dropdownColor: kDarkBlue,
            isExpanded: false,
            value: boardSize.toString(),
            iconSize: 30,
            iconEnabledColor: kWhite,
            focusColor: kWhite,
            borderRadius: BorderRadius.circular(10),
            underline: Container(height: 0)));
  }

  Widget getTurn() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(isTurnO ? 'assets/games/xo/o.png' : 'assets/games/xo/x.png', height: 30, width: 30),
      const SizedBox(height: 5),
      Text(isTurnO ? 'نوبت بازیکن' : 'نوبت بازیکن', style: const TextStyle(fontSize: 25, color: kWhite))
    ]);
  }

  Widget getGridView() {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
            child: GridView.builder(
                // shrinkWrap: true,
                itemCount: boardSize * boardSize,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: boardSize),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (xoList[index] != 'box') {
                                return;
                              }
                              if (isTurnO) {
                                xoList[index] = 'o';
                                filledBoxes = filledBoxes + 1;
                              } else {
                                xoList[index] = 'x';
                                filledBoxes = filledBoxes + 1;
                              }
                              isTurnO = !isTurnO;

                              checkWinner();

                              if (winnerO == true) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CongratulationsDialogO(onPressed: () {});
                                    });
                              }

                              if (winnerX == true) {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CongratulationsDialogX(onPressed: () {});
                                    });
                              }

                              if (boardSize == 3) {
                                if (filledBoxes == 9 && winnerO == false && winnerX == false) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CongratulationsDialogEqual(onPressed: () {});
                                      });
                                }
                              }

                              if (boardSize == 4) {
                                if (filledBoxes == 16 && winnerO == false && winnerX == false) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return CongratulationsDialogEqual(onPressed: () {});
                                      });
                                }
                              }
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(color: kBoxColor, borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image(image: AssetImage('assets/games/xo/${xoList[index]}.png'))))));
                })));
  }

  void checkWinner() {
    if (boardSize == 3) {
      if (xoList[0] == xoList[1] && xoList[0] == xoList[2] && xoList[0] != 'box') {
        if (xoList[0] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[3] == xoList[4] && xoList[3] == xoList[5] && xoList[3] != 'box') {
        if (xoList[3] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[6] == xoList[7] && xoList[6] == xoList[8] && xoList[6] != 'box') {
        if (xoList[6] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[0] == xoList[3] && xoList[0] == xoList[6] && xoList[0] != 'box') {
        if (xoList[0] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[1] == xoList[4] && xoList[1] == xoList[7] && xoList[1] != 'box') {
        if (xoList[1] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[2] == xoList[5] && xoList[8] == xoList[2] && xoList[2] != 'box') {
        if (xoList[2] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[0] == xoList[4] && xoList[0] == xoList[8] && xoList[0] != 'box') {
        if (xoList[0] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[2] == xoList[4] && xoList[2] == xoList[6] && xoList[2] != 'box') {
        if (xoList[2] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (filledBoxes == 9) {
        equal = equal + 1;
        finishGame();
        return;
      }
    }
    if (boardSize == 4) {
      if (xoList[0] == xoList[4] &&
          xoList[0] == xoList[8] &&
          xoList[0] == xoList[12] &&
          xoList[0] != 'box') {
        if (xoList[0] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[1] == xoList[5] &&
          xoList[1] == xoList[9] &&
          xoList[1] == xoList[13] &&
          xoList[1] != 'box') {
        if (xoList[1] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[2] == xoList[6] &&
          xoList[2] == xoList[10] &&
          xoList[2] == xoList[14] &&
          xoList[2] != 'box') {
        if (xoList[2] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[3] == xoList[7] &&
          xoList[3] == xoList[11] &&
          xoList[3] == xoList[15] &&
          xoList[3] != 'box') {
        if (xoList[3] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[0] == xoList[1] &&
          xoList[0] == xoList[2] &&
          xoList[0] == xoList[3] &&
          xoList[0] != 'box') {
        if (xoList[0] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[4] == xoList[5] &&
          xoList[4] == xoList[6] &&
          xoList[4] == xoList[7] &&
          xoList[4] != 'box') {
        if (xoList[4] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[8] == xoList[9] &&
          xoList[8] == xoList[10] &&
          xoList[8] == xoList[11] &&
          xoList[8] != 'box') {
        if (xoList[8] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[12] == xoList[13] &&
          xoList[12] == xoList[14] &&
          xoList[12] == xoList[15] &&
          xoList[12] != 'box') {
        if (xoList[12] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[0] == xoList[5] &&
          xoList[0] == xoList[10] &&
          xoList[0] == xoList[15] &&
          xoList[0] != 'box') {
        if (xoList[0] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (xoList[3] == xoList[6] &&
          xoList[3] == xoList[9] &&
          xoList[3] == xoList[12] &&
          xoList[3] != 'box') {
        if (xoList[3] == txtPlayerO) {
          playerO++;
          winnerO = true;
          finishGame();
        } else {
          playerX++;
          winnerX = true;
          finishGame();
          return;
        }
      }

      if (filledBoxes == 16) {
        equal = equal + 1;
        finishGame();
        return;
      }
    }
  }

  void finishGame() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        for (int i = 0; i < xoList.length; i++) {
          xoList[i] = 'box';
          filledBoxes = 0;
          winnerO = false;
          winnerX = false;
        }
      });
    });
  }

  void clearGame() {
    setState(() {
      for (int i = 0; i < xoList.length; i++) {
        xoList[i] = 'box';
      }
      playerO = 0;
      playerX = 0;
      filledBoxes = 0;
      equal = 0;
      winnerO = false;
      winnerX = false;
    });
  }

  Widget getScoreBoard() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
              height: 90,
              width: 110,
              decoration: BoxDecoration(color: kScoreBoardBox, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset('assets/games/xo/black-X.png', height: 30, width: 30),
                      const Text('بازیکن',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor))
                    ]),
                    Text('$playerX',
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: kNumberColor))
                  ])))),
      Container(
          height: 90,
          width: 110,
          decoration: BoxDecoration(color: kScoreBoardBox, borderRadius: BorderRadius.circular(15)),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('مساوی', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor)),
                Text('$equal', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: kNumberColor))
              ]))),
      Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              height: 90,
              width: 110,
              decoration: BoxDecoration(color: kScoreBoardBox, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Image.asset('assets/games/xo/black-O.png', height: 30, width: 30),
                      const Text('بازیکن',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kTextColor))
                    ]),
                    Text('$playerO',
                        style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: kNumberColor))
                  ]))))
    ]);
  }
}
