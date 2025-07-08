import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LottoBall extends StatelessWidget {
  final String path;

  const LottoBall({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: SvgPicture.asset(
        path,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
