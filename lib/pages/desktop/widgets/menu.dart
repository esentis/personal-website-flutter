import 'package:esentispws/components/menu_item.dart';
import 'package:esentispws/components/states.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../mainpage_desktop.dart';

class Menu extends StatelessWidget {
  const Menu({
    @required this.localToggler,
    @required AnimationController scaffoldBgColorController,
    Key key,
  })  : _scaffoldBgColorController = scaffoldBgColorController,
        super(key: key);

  final Language localToggler;
  final AnimationController _scaffoldBgColorController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //HOME
        MenuItem(
          onPress: () {
            mainPageController.animateToPage(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic);
          },
          text: localToggler.localeStatus == kLocale.english
              ? kMenuHomeEn
              : kMenuHomeGr,
          color: textColorSwitches.evaluate(
            AlwaysStoppedAnimation(_scaffoldBgColorController.value),
          ),
        ),
        //PORTFOLIO
        MenuItem(
          onPress: () {
            mainPageController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic);
          },
          text: localToggler.localeStatus == kLocale.english
              ? kMenuPortfolioEn
              : kMenuPortfolioGr,
          color: textColorSwitches.evaluate(
            AlwaysStoppedAnimation(_scaffoldBgColorController.value),
          ),
        ),
        //SKILLS
        MenuItem(
          onPress: () {
            mainPageController.animateToPage(2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic);
          },
          text: localToggler.localeStatus == kLocale.english
              ? kMenuSkillsEn
              : kMenuSkillsGr,
          color: textColorSwitches.evaluate(
            AlwaysStoppedAnimation(_scaffoldBgColorController.value),
          ),
        ),
        //CONTACT
        MenuItem(
          onPress: () {
            mainPageController.animateToPage(3,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic);
          },
          text: localToggler.localeStatus == kLocale.english
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
