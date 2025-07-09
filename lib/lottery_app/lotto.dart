import 'package:flutter/material.dart';
import 'package:login_lotto/lottery_app/dialog.dart';
import 'dart:math';
import 'package:login_lotto/lottery_app/lotto_ball.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  List<List<int>> listLottery = [];
  final ScrollController _scrollController = ScrollController();

  void _createNumber() {
    if (listLottery.length < 15) {
      setState(() {
        // 로또 번호 생성 로직
        List<int> lottery = [];
        while (true) {
          var rnd = Random().nextInt(45) + 1;
          if (!lottery.contains(rnd)) {
            lottery.add(rnd);
          }

          if (lottery.length == 6) {
            break;
          }
        }
        lottery.sort();
        listLottery.add(lottery);
      });
    } else {
      Fluttertoast.showToast(
        msg: "15번까지만 생성 가능합니다.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
    }
  }

  void showPopup(context, String title, String number) {
    showDialog(
      context: context,
      builder: (context) => PopupDialog(title: title, number: number),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 217, 239),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: RawScrollbar(
                controller: _scrollController,
                thumbColor: const Color.fromARGB(255, 122, 157, 218),
                thumbVisibility: true,
                trackVisibility: true,
                thickness: 15,
                radius: const Radius.circular(10),
                interactive: true,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(8),
                  itemCount: listLottery.length,
                  itemBuilder: (context, index) {
                    int currentIndex = index + 1;
                    var path_1 = 'svg/${listLottery[index][0]}.svg';
                    var path_2 = 'svg/${listLottery[index][1]}.svg';
                    var path_3 = 'svg/${listLottery[index][2]}.svg';
                    var path_4 = 'svg/${listLottery[index][3]}.svg';
                    var path_5 = 'svg/${listLottery[index][4]}.svg';
                    var path_6 = 'svg/${listLottery[index][5]}.svg';
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          '$currentIndex번째 추첨 번호',
                          style: TextStyle(
                            fontFamily: 'NanumGothicCoding',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showPopup(
                              context,
                              currentIndex.toString(),
                              listLottery[index].toString(),
                            );
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.white,
                          ),
                          iconSize: 30.0,
                        ),
                        contentPadding: EdgeInsets.zero,
                        subtitle: Scrollbar(
                          trackVisibility: true,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                LottoBall(path: path_1),
                                const SizedBox(width: 2),
                                LottoBall(path: path_2),
                                const SizedBox(width: 2),
                                LottoBall(path: path_3),
                                const SizedBox(width: 2),
                                LottoBall(path: path_4),
                                const SizedBox(width: 2),
                                LottoBall(path: path_5),
                                const SizedBox(width: 2),
                                LottoBall(path: path_6),
                                const SizedBox(width: 2),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: Lottie.asset('lottie/cat.json'),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            right:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 10
                    : 76,
            bottom:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 76
                    : 10,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: _createNumber, // 메서드의 참조만 전달
              tooltip: "Create Another Number Set",
              heroTag: 'createNumberBtn',
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
          Positioned(
            right:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 10
                    : 6,
            bottom:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 6
                    : 10,
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              tooltip: "Clear Numbers",
              heroTag: 'clearNumberBtn',
              onPressed: () {
                setState(() {
                  listLottery.clear();
                });
              }, // 메서드의 참조만 전달
              child: const Icon(Icons.refresh_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
