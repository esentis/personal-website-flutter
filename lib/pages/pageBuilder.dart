import 'package:esentispws/pages/desktop/mainpage_desktop.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      mobile: Container(
        width: 150,
        height: 150,
        color: Colors.blue,
        child: const Text('MOBILE'),
      ),
      tablet: Container(
        width: 150,
        height: 150,
        color: Colors.yellow,
        child: const Text('Tablet'),
      ),

      /// Desktop
      desktop: MainPageDesktop(),
      watch: Container(
        width: 150,
        height: 150,
        color: Colors.purple,
        child: const Text('Watch'),
      ),
    );
  }
}
