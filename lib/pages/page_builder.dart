import 'package:esentispws/pages/desktop/landing_page_desktop.dart';
import 'package:esentispws/state/device_info.dart';
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
    return ScreenTypeLayout.builder(
      mobile: (context) => const DeviceInfo(
        type: DeviceType.mobile,
        child: LandingPage(),
      ),
      tablet: (context) => const DeviceInfo(
        type: DeviceType.tablet,
        child: LandingPage(),
      ),
      desktop: (context) => const DeviceInfo(
        type: DeviceType.desktop,
        child: LandingPage(),
      ),
      watch: (context) => const DeviceInfo(
        type: DeviceType.watch,
        child: LandingPage(),
      ),
    );
  }
}
