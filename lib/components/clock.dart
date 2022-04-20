import 'dart:async';

import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_extensions/string_extensions.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final date = DateFormat("HH:mm:ss");
    final String dateString = date.format(DateTime.now());
    return Column(
      key: ValueKey(DateTime.now().toString()),
      children: [
        Text(
          '${DateTime.now().day} ${DateTime.now().toString().getMonthFromDate()} ${DateTime.now().year} ',
          textAlign: TextAlign.center,
          style: kStyleDefault.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          dateString,
          textAlign: TextAlign.center,
          style: kStyleDefault.copyWith(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
