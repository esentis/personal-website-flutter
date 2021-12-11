import 'package:esentispws/pages/not_found.dart';
import 'package:esentispws/pages/page_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  // Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      initialRoute: '/',
      unknownRoute: GetPage(
        name: '/NotFound',
        page: () => PageNotFound(),
        transition: Transition.fadeIn,
      ),
      getPages: [
        GetPage(name: '/', page: () => MainPage()),
      ],
      title: 'George Leonidis',
      home: MainPage(),
    );
  }
}
