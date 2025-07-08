import 'package:flutter/material.dart';
import 'dart:math';

class Lotto extends StatefulWidget {
  const Lotto({super.key});

  @override
  State<Lotto> createState() => _LottoState();
}

class _LottoState extends State<Lotto> {
  List<List<int>> listLottery = [];

  void _createNumber() {
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
      listLottery.add(lottery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lotto App')),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: listLottery.length,
          itemBuilder: (context, index) {
            return SizedBox(
              child: Text(
                listLottery[index].toString(),
                style: const TextStyle(color: Colors.red),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: Colors.grey, thickness: 0.5);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNumber, // 메서드의 참조만 전달
        child: const Icon(Icons.add),
      ),
    );
  }
}
