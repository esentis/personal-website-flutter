import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/page_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({required this.deviceType});
  final DeviceType deviceType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: kButtonStyleDefault,
                onPressed: () {
                  launchLink('https://www.github.com/esentis');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.github,
                    size: 50,
                    color: kColorMain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: kButtonStyleDefault,
                onPressed: () {
                  launchLink('mailto:esentakos@yahoo.gr');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.envelopeOpen,
                    size: 50,
                    color: kColorMain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: kButtonStyleDefault,
                onPressed: () {
                  launchLink(
                    'https://www.linkedin.com/in/gleonidis/',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.linkedin,
                    size: 50,
                    color: kColorMain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: kButtonStyleDefault,
                onPressed: () {
                  launchLink(
                    'https://play.google.com/store/apps/dev?id=7040603848130357887',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.googlePlay,
                    size: 50,
                    color: kColorMain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
