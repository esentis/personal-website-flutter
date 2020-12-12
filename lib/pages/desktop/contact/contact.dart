import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  void launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
