import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: ElevatedButton(
            style: ButtonStyle(
              mouseCursor: ContactCursor(),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white.withOpacity(0.1)),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.white.withOpacity(0.1),
              ),
            ),
            onPressed: () {
              launchLink('https://www.github.com/esentis');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.github,
                size: 65,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            style: ButtonStyle(
                mouseCursor: ContactCursor(),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.white.withOpacity(0.1)),
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white.withOpacity(0.1),
                )),
            onPressed: () {
              launchLink('mailto:esentakos@yahoo.gr');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.envelopeOpen,
                size: 65,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            style: ButtonStyle(
              mouseCursor: ContactCursor(),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white.withOpacity(0.1)),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.white.withOpacity(0.1),
              ),
            ),
            onPressed: () {
              launchLink('https://www.linkedin.com/in/gleonidis/');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.linkedin,
                size: 65,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Flexible(
          child: ElevatedButton(
            style: ButtonStyle(
              mouseCursor: ContactCursor(),
              overlayColor: MaterialStateProperty.resolveWith(
                  (states) => Colors.white.withOpacity(0.1)),
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Colors.white.withOpacity(0.1),
              ),
            ),
            onPressed: () {
              launchLink(
                  'https://play.google.com/store/apps/dev?id=7040603848130357887');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.googlePlay,
                size: 65,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
