import 'package:esentispws/pages/desktop/landing_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/landing_page_mobile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder();
  }
}

class ResponsiveBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: LandingPageMobile(),
      tablet: Container(
        width: 150,
        height: 150,
        color: Colors.yellow,
        child: const Text('Tablet'),
      ),

      /// Desktop
      desktop: LandingPageDesktop(),
      watch: Container(
        width: 150,
        height: 150,
        color: Colors.purple,
        child: const Text('Watch'),
      ),
    );
  }
}
