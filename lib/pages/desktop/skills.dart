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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kCssTextEn
                      : kCssTextGR,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'CSS3',
                  image: 'assets/css3.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kHtmlTextEn
                      : kHtmlTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'HTML5',
                  image: 'assets/html5.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kJavascriptTextEn
                      : kJavascriptTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'javaScript',
                  image: 'assets/javascript.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kjQueryTextEn
                      : kjQueryTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'jQuery',
                  image: 'assets/jquery.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kReactTextEn
                      : kReactTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'React',
                  image: 'assets/react.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kPhotoshopTextEn
                      : kPhotoshopTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'Photoshop',
                  image: 'assets/photoshop.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kIllustratorTextEn
                      : kIllustratorTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'Illustrator',
                  image: 'assets/ai.png',
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kMongoDbTextEn
                      : kMongoDbTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'Mongodb',
                  image: 'assets/mongodb.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kNodeJsTextEn
                      : kNodeJsTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'Node.js',
                  image: 'assets/nodejs.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kExpressJsEn
                      : kExpressJsGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'Express',
                  image: 'assets/express.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kPostgresSqlTextEn
                      : kPostgresSqlTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'PostgreSQL',
                  image: 'assets/postgreSQL.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kJavaTextEn
                      : kJavaTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: 'Java',
                  image: 'assets/java.png',
                ),
              ),
              Flexible(
                child: Skill(
                  text: localeToggler.localeStatus == kLocale.english
                      ? kDotnetTextEn
                      : kDotnetTextGr,
                  shadowColor: textColorSwitches.evaluate(
                      AlwaysStoppedAnimation(_scaffoldBgColorController.value)),
                  subtitle: '.NET',
                  image: 'assets/dotnet.png',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
