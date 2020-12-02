import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingPageMobile extends StatefulWidget {
  @override
  _LandingPageMobileState createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffb088f9),
            Color(0xffda9ff9),
            Color(0xff98acf8),
            Color(0xffbedcfa)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [],
        ),
      ),
    );
  }
}
