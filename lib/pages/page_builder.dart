import 'package:esentispws/pages/desktop/landing_page_desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

enum DeviceType {
  mobile,
  tablet,
  desktop,
  watch,
}

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
      mobile: const LandingPageDesktop(
        deviceType: DeviceType.mobile,
      ),

      /// Tablet
      tablet: const LandingPageDesktop(
        deviceType: DeviceType.tablet,
      ),

      /// Desktop
      desktop: const LandingPageDesktop(
        deviceType: DeviceType.desktop,
      ),

      /// Watch
      watch: const LandingPageDesktop(
        deviceType: DeviceType.watch,
      ),
    );
  }
}
