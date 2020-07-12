import 'package:esentispws/components/states.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/pageBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'George Leonidis',
        home: MainPage(),
      ),
    );
  }
}