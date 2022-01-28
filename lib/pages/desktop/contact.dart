import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/landing_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactCursor extends MaterialStateMouseCursor {
  @override
  MouseCursor resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return SystemMouseCursors.forbidden;
    }
    return SystemMouseCursors.click;
  }

  @override
  String get debugDescription => 'ListTileCursor()';
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    required this.onCheckWork,
  });
  final VoidCallback onCheckWork;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Clock(),
        ),
        TextButton(
          onPressed: onCheckWork,
          child: Text(
            'Check my work',
            style: kStyleDefault.copyWith(
              fontSize: 40,
            ),
          ),
        ),
        Column(
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
                      launchLink('https://www.linkedin.com/in/gleonidis/');
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
        ),
      ],
    );
  }
}
