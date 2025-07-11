import 'package:flutter/material.dart';
import 'package:login_lotto/lottery_app/lotto.dart';
import 'package:login_lotto/responsive/breakpoint.dart';
import 'package:login_lotto/responsive/responsive_center.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LayoutLotto extends StatelessWidget {
  const LayoutLotto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 217, 239),
      appBar: AppBar(
        title: Text(
          '로또또 로또또',
          style: TextStyle(
            fontFamily: 'JetBrainsMono',
            fontSize: 30,
            color: Color.fromARGB(255, 146, 35, 35),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 11, 109),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app_sharp, color: Colors.white),
          ),
        ],
      ),
      body: const ResponsiveCenter(
        maxContentWidth: Breakpoint.deskTop,
        padding: EdgeInsets.all(16),
        child: Lotto(),
      ),
    );
  }
}
