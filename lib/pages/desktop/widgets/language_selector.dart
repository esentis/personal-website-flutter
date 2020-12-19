import 'package:esentispws/components/states.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esentispws/constants.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    Key key,
  }) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    var localeToggler = context.watch<Language>();
    return GestureDetector(
      onTap: () {
        localeToggler.toggleLanguage();
        setState(() {});
      },
      child: Container(
        height: 50,
        width: 50,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              localeToggler.localeStatus == kLocale.english
                  ? 'english.png'
                  : 'greekflag.png',
            ),
          ),
        ),
      ),
    );
  }
}
