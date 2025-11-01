import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logoSize = size.width * 0.4; // 40% of screen width
    return Image.asset(
      'assets/images/logo.png',
      width: logoSize,
      height: logoSize,
      color: Colors.white,
    );
  }
}
