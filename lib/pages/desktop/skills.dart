import 'package:esentispws/components/skill.dart';
import 'package:esentispws/components/states.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Skills extends StatelessWidget {
  const Skills({
    @required this.localeToggler,
    @required this.textColorSwitches,
    @required AnimationController scaffoldBgColorController,
    Key key,
  })  : _scaffoldBgColorController = scaffoldBgColorController,
        super(key: key);

  final Language localeToggler;
  final Animatable<Color> textColorSwitches;
  final AnimationController _scaffoldBgColorController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              Card(
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    'flutter.png',
                  ),
                ),
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kCssTextEn
                    : kCssTextGR,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'CSS3',
                image: 'css3.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kHtmlTextEn
                    : kHtmlTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'HTML5',
                image: 'html5.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kJavascriptTextEn
                    : kJavascriptTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'javaScript',
                image: 'javascript.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kjQueryTextEn
                    : kjQueryTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'jQuery',
                image: 'jquery.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kReactTextEn
                    : kReactTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'React',
                image: 'react.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kPhotoshopTextEn
                    : kPhotoshopTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'Photoshop',
                image: 'photoshop.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kIllustratorTextEn
                    : kIllustratorTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'Illustrator',
                image: 'ai.png',
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kMongoDbTextEn
                    : kMongoDbTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'Mongodb',
                image: 'mongodb.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kNodeJsTextEn
                    : kNodeJsTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'Node.js',
                image: 'nodejs.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kExpressJsEn
                    : kExpressJsGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'Express',
                image: 'express.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kPostgresSqlTextEn
                    : kPostgresSqlTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'PostgreSQL',
                image: 'postgreSQL.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kJavaTextEn
                    : kJavaTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: 'Java',
                image: 'java.png',
              ),
              Skill(
                text: localeToggler.localeStatus == kLocale.english
                    ? kDotnetTextEn
                    : kDotnetTextGr,
                shadowColor: textColorSwitches.evaluate(
                    AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                subtitle: '.NET',
                image: 'dotnet.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
