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
      /// Mobile
      mobile: LandingPageDesktop(),

      /// Tablet
      tablet: LandingPageDesktop(),

      /// Desktop
      desktop: LandingPageDesktop(),

      /// Watch
      watch: LandingPageDesktop(),
    );
  }
}
