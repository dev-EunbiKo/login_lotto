import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LottoBall extends StatelessWidget {
  final String path;

  const LottoBall({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: SvgPicture.asset(
        path,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
