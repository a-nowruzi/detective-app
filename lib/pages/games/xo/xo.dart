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
  List XorOList = [
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
                              if (XorOList[index] != 'box') {
                                return;
                              }
                              if (isTurnO) {
                                XorOList[index] = 'o';
                                filledBoxes = filledBoxes + 1;
                              } else {
                                XorOList[index] = 'x';
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
                                  child: Image(image: AssetImage('assets/games/xo/${XorOList[index]}.png'))))));
                })));
  }

  void checkWinner() {
    if (boardSize == 3) {
      if (XorOList[0] == XorOList[1] && XorOList[0] == XorOList[2] && XorOList[0] != 'box') {
        if (XorOList[0] == txtPlayerO) {
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

      if (XorOList[3] == XorOList[4] && XorOList[3] == XorOList[5] && XorOList[3] != 'box') {
        if (XorOList[3] == txtPlayerO) {
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

      if (XorOList[6] == XorOList[7] && XorOList[6] == XorOList[8] && XorOList[6] != 'box') {
        if (XorOList[6] == txtPlayerO) {
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

      if (XorOList[0] == XorOList[3] && XorOList[0] == XorOList[6] && XorOList[0] != 'box') {
        if (XorOList[0] == txtPlayerO) {
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

      if (XorOList[1] == XorOList[4] && XorOList[1] == XorOList[7] && XorOList[1] != 'box') {
        if (XorOList[1] == txtPlayerO) {
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

      if (XorOList[2] == XorOList[5] && XorOList[8] == XorOList[2] && XorOList[2] != 'box') {
        if (XorOList[2] == txtPlayerO) {
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

      if (XorOList[0] == XorOList[4] && XorOList[0] == XorOList[8] && XorOList[0] != 'box') {
        if (XorOList[0] == txtPlayerO) {
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

      if (XorOList[2] == XorOList[4] && XorOList[2] == XorOList[6] && XorOList[2] != 'box') {
        if (XorOList[2] == txtPlayerO) {
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
      if (XorOList[0] == XorOList[4] &&
          XorOList[0] == XorOList[8] &&
          XorOList[0] == XorOList[12] &&
          XorOList[0] != 'box') {
        if (XorOList[0] == txtPlayerO) {
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

      if (XorOList[1] == XorOList[5] &&
          XorOList[1] == XorOList[9] &&
          XorOList[1] == XorOList[13] &&
          XorOList[1] != 'box') {
        if (XorOList[1] == txtPlayerO) {
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

      if (XorOList[2] == XorOList[6] &&
          XorOList[2] == XorOList[10] &&
          XorOList[2] == XorOList[14] &&
          XorOList[2] != 'box') {
        if (XorOList[2] == txtPlayerO) {
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

      if (XorOList[3] == XorOList[7] &&
          XorOList[3] == XorOList[11] &&
          XorOList[3] == XorOList[15] &&
          XorOList[3] != 'box') {
        if (XorOList[3] == txtPlayerO) {
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

      if (XorOList[0] == XorOList[1] &&
          XorOList[0] == XorOList[2] &&
          XorOList[0] == XorOList[3] &&
          XorOList[0] != 'box') {
        if (XorOList[0] == txtPlayerO) {
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

      if (XorOList[4] == XorOList[5] &&
          XorOList[4] == XorOList[6] &&
          XorOList[4] == XorOList[7] &&
          XorOList[4] != 'box') {
        if (XorOList[4] == txtPlayerO) {
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

      if (XorOList[8] == XorOList[9] &&
          XorOList[8] == XorOList[10] &&
          XorOList[8] == XorOList[11] &&
          XorOList[8] != 'box') {
        if (XorOList[8] == txtPlayerO) {
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

      if (XorOList[12] == XorOList[13] &&
          XorOList[12] == XorOList[14] &&
          XorOList[12] == XorOList[15] &&
          XorOList[12] != 'box') {
        if (XorOList[12] == txtPlayerO) {
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

      if (XorOList[0] == XorOList[5] &&
          XorOList[0] == XorOList[10] &&
          XorOList[0] == XorOList[15] &&
          XorOList[0] != 'box') {
        if (XorOList[0] == txtPlayerO) {
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

      if (XorOList[3] == XorOList[6] &&
          XorOList[3] == XorOList[9] &&
          XorOList[3] == XorOList[12] &&
          XorOList[3] != 'box') {
        if (XorOList[3] == txtPlayerO) {
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
        for (int i = 0; i < XorOList.length; i++) {
          XorOList[i] = 'box';
          filledBoxes = 0;
          winnerO = false;
          winnerX = false;
        }
      });
    });
  }

  void clearGame() {
    setState(() {
      for (int i = 0; i < XorOList.length; i++) {
        XorOList[i] = 'box';
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
