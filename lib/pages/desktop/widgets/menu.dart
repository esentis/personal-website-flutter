import 'package:esentispws/components/menu_item.dart';
import 'package:esentispws/components/states.dart';
import 'package:flutter/material.dart';

import 'package:esentispws/constants.dart';

class Menu extends StatelessWidget {
  const Menu({
    @required this.localeToggler,
    @required AnimationController scaffoldBgColorController,
    this.onPortfolio,
    this.onContact,
    this.onSkills,
    Key key,
  })  : _scaffoldBgColorController = scaffoldBgColorController,
        super(key: key);

  final Language localeToggler;
  final AnimationController _scaffoldBgColorController;
  final VoidCallback onPortfolio;
  final VoidCallback onSkills;
  final VoidCallback onContact;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //PORTFOLIO
        MenuItem(
          onPress: onPortfolio,
          text: localeToggler.localeStatus == kLocale.english
              ? kMenuPortfolioEn
              : kMenuPortfolioGr,
          color: textColorSwitches.evaluate(
            AlwaysStoppedAnimation(_scaffoldBgColorController.value),
          ),
        ),
        //SKILLS
        MenuItem(
          onPress: onSkills,
          text: localeToggler.localeStatus == kLocale.english
              ? kMenuSkillsEn
              : kMenuSkillsGr,
          color: textColorSwitches.evaluate(
            AlwaysStoppedAnimation(_scaffoldBgColorController.value),
          ),
        ),
        //CONTACT
        MenuItem(
          onPress: onContact,
          text: localeToggler.localeStatus == kLocale.english
              ? kMenuContactEn
              : kMenuContactGr,
          color: textColorSwitches.evaluate(
            AlwaysStoppedAnimation(_scaffoldBgColorController.value),
          ),
        ),
      ],
    );
  }
}
