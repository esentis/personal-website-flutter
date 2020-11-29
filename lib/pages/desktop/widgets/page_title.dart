import 'package:esentispws/components/states.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:esentispws/constants.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    @required AnimationController scaffoldBgColorController,
    Key key,
  })  : _scaffoldBgColorController = scaffoldBgColorController,
        super(key: key);

  final AnimationController _scaffoldBgColorController;

  @override
  Widget build(BuildContext context) {
    var localeToggler = context.watch<Language>();
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        children: [
          Text(
            localeToggler.localeStatus == kLocale.english
                ? 'George Leonidis'
                : 'Γιώργος Λεωνίδης',
            style: GoogleFonts.openSansCondensed(
              fontSize: 50,
              color: textColorSwitches.evaluate(
                  AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
            ),
          ),
          Text(
            localeToggler.localeStatus == kLocale.english
                ? 'Software Developer'
                : 'Προγραμματιστής Λογισμικού',
            style: GoogleFonts.openSansCondensed(
              fontSize: 25,
              color: textColorSwitches.evaluate(
                  AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
            ),
          ),
        ],
      ),
    );
  }
}
