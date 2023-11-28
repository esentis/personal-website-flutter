import 'dart:async';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatefulWidget {
  const LandingPage();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  bool isTyping = true;

  List<Widget> messagesWidgets = [
    BubbleSpecialThree(
      text: 'Hello there !',
      color: Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
    ),
    BubbleSpecialThree(
      text: "I'm George, welcome to my website",
      color: Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
    ),
    BubbleSpecialThree(
      text: 'Are you looking for a mobile developer ?',
      color: Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
    ),
    BubbleSpecialThree(
      text: 'I can definetely help you with that, please contact me.',
      color: Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
    ),
    BubbleSpecialThree(
      text: 'LinkedIn',
      color: Color(0xFFE8E8EE),
      textStyle: TextStyle(color: Colors.blue),
      tail: true,
      isSender: false,
    ),
    BubbleSpecialThree(
      text: 'GitHub',
      color: Color(0xFFE8E8EE),
      textStyle: TextStyle(color: Colors.blue),
      tail: true,
      isSender: false,
    ),
    BubbleSpecialThree(
      text: 'e-mail',
      color: Color(0xFFE8E8EE),
      textStyle: TextStyle(color: Colors.blue),
      tail: true,
      isSender: false,
    ),
  ];

  List<String> messagesTexts = [
    'Hello there !',
    "I'm George, welcome to my website",
    'Are you looking for a mobile developer ?',
    'I can definetely help you with that, please contact me.',
  ];

  List<Widget> shownMessages = [];

  // Method to add a message to the list in periodic intervals

  Future<void> addMessage() async {
    // await Future.delayed(
    //   Duration(
    //     milliseconds: messagesTexts.first.length * 180,
    //   ),
    // );
    if (messagesWidgets.isNotEmpty) {
      shownMessages.add(messagesWidgets.removeAt(0));
      setState(() {
        if (messagesWidgets.isEmpty) {
          isTyping = false;
        }
      });

      Timer(const Duration(seconds: 2), () {
        addMessage();
      });
    } else {
      setState(() {
        isTyping = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    addMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ...shownMessages,
                  if (isTyping)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Stack(
                        children: [
                          const BubbleSpecialThree(
                            text: '        ',
                            color: Color(0xFFE8E8EE),
                            isSender: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 19.0,
                              top: 2,
                            ),
                            child: Lottie.network(
                              'https://lottie.host/482d6f33-5a86-4678-8ed5-9430d3967450/7qHvLX5Nam.json',
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  launchLink('https://www.github.com/esentis');
                },
                child: Center(
                  child: Text(
                    'esentis ©',
                    style: kStyleDefault.copyWith(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
