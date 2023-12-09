import 'package:esentispws/pages/desktop/lock_screen.dart';
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
        child: LockScreen(),
      ),
      tablet: (context) => const DeviceInfo(
        type: DeviceType.tablet,
        child: LockScreen(),
      ),
      desktop: (context) => const DeviceInfo(
        type: DeviceType.desktop,
        child: LockScreen(),
      ),
      watch: (context) => const DeviceInfo(
        type: DeviceType.watch,
        child: LockScreen(),
      ),
    );
  }
}
