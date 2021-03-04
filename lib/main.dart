import 'package:esentispws/components/states.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/contact/contact.dart';
import 'package:esentispws/pages/not_found.dart';
import 'package:esentispws/pages/pageBuilder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() async {
  // Firebase init
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ThemeStyle>(
            create: (_) => ThemeStyle(themeStatus: kTheme.light)),
        ListenableProvider<Language>(
            create: (_) => Language(localeStatus: kLocale.english)),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        unknownRoute: GetPage(
          name: '/notfound',
          page: () => PageNotFound(),
          transition: Transition.zoom,
        ),
        getPages: [
          GetPage(name: '/', page: () => MainPage()),
          GetPage(name: '/contact', page: () => ContactInfo()),
        ],
        title: 'George Leonidis',
        home: MainPage(),
      ),
    );
  }
}
