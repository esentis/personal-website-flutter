import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              launchLink('http://www.github.com/esentis');
            },
            child: Image.asset(
              'assets/github_small.png',
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              launchLink('mailto:esentakos@yahoo.gr');
            },
            child: Image.asset(
              'assets/email.png',
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              launchLink('https://www.linkedin.com/in/gleonidis/');
            },
            child: Image.asset(
              'assets/linked.png',
            ),
          ),
        ),
      ],
    );
  }
}
