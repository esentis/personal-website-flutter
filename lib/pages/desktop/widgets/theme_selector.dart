import 'package:esentispws/components/states.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esentispws/constants.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({
    @required AnimationController scaffoldBgColorController,
    Key key,
  })  : _scaffoldBgColorController = scaffoldBgColorController,
        super(key: key);

  final AnimationController _scaffoldBgColorController;

  @override
  _ThemeSelectorState createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  @override
  Widget build(BuildContext context) {
    var themeToggler = context.watch<ThemeStyle>();
    return GestureDetector(
      onTap: () {
        themeToggler.toggleTheme();
        themeToggler.themeStatus == kTheme.light
            ? widget._scaffoldBgColorController
                .animateTo(0, curve: Curves.easeInOut)
            : widget._scaffoldBgColorController
                .animateTo(1, curve: Curves.easeInOut);
        setState(() {});
      },
      child: Container(
        width: 100,
        height: 100,
        child: FlareActor('dark_light.flr',
            alignment: Alignment.center,
            animation: themeToggler.themeStatus == kTheme.light ? 'A1' : 'A2'),
      ),
    );
  }
}
