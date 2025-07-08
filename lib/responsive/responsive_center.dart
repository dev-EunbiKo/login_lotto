import 'package:flutter/material.dart';

class ResponsiveCenter extends StatelessWidget {
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;

  const ResponsiveCenter({
    super.key,
    required this.maxContentWidth,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      // 스크린으로부터 loose constraints 전달 받음
      child: SizedBox(
        // tight constraints 전달 받음
        width: maxContentWidth,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
