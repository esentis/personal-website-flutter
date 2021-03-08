import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Portfolio',
          style: kStyleDefault.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          'Coming soon...',
          style: kStyleDefault.copyWith(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
