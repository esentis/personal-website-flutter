import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            child: GestureDetector(
          onTap: () {
            launchLink('https://www.github.com/esentis');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('github.png'),
          ),
        )),
        Flexible(
            child: GestureDetector(
          onTap: () {
            launchLink('mailto:esentakos@yahoo.gr');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('email.png'),
          ),
        )),
        Flexible(
          child: GestureDetector(
            onTap: () {
              launchLink('https://www.linkedin.com/in/gleonidis/');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('linked.png'),
            ),
          ),
        ),
        Flexible(
          child: GestureDetector(
            onTap: () {
              launchLink(
                  'https://play.google.com/store/apps/dev?id=7040603848130357887');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('play.png'),
            ),
          ),
        ),
      ],
    );
  }
}
