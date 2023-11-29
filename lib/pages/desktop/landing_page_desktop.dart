import 'dart:async';
import 'dart:ui';

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
  Color imessageColor = const Color(0xFF1F8AFF);
  TextStyle chatStyle = const TextStyle(
    fontFamily: 'SanFrancisco',
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  late List<Widget> messagesWidgets = [
    BubbleSpecialThree(
      text: "Hello there, I'm George.",
      color: const Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
      textStyle: chatStyle,
    ),
    BubbleSpecialThree(
      text: 'Are you looking for a mobile developer ? I can help you out !',
      color: const Color(0xFFE8E8EE),
      tail: false,
      isSender: false,
      textStyle: chatStyle,
    ),
    GestureDetector(
      onTap: () {
        launchLink('https://www.github.com/esentis');
      },
      child: BubbleSpecialThree(
        text: "Take a peak of my work.",
        color: const Color(0xFFE8E8EE),
        textStyle: chatStyle.copyWith(
          color: imessageColor,
          decoration: TextDecoration.underline,
          decorationColor: imessageColor,
        ),
        isSender: false,
        tail: false,
      ),
    ),
    GestureDetector(
      onTap: () {
        launchLink(
          'https://www.linkedin.com/in/gleonidis/',
        );
      },
      child: BubbleSpecialThree(
        text: 'You can also reach me on LinkedIn.',
        color: const Color(0xFFE8E8EE),
        textStyle: chatStyle.copyWith(
          color: imessageColor,
          decoration: TextDecoration.underline,
          decorationColor: imessageColor,
        ),
        isSender: false,
        tail: false,
      ),
    ),
    GestureDetector(
      onTap: () {
        launchLink('mailto:esentakos@yahoo.gr');
      },
      child: BubbleSpecialThree(
        text: 'Or alternatively, send me an email.',
        color: const Color(0xFFE8E8EE),
        textStyle: chatStyle.copyWith(
          color: imessageColor,
          decoration: TextDecoration.underline,
          decorationColor: imessageColor,
        ),
        isSender: false,
        tail: false,
      ),
    ),
    BubbleSpecialThree(
      text: 'I am looking forward to hearing from you, have a nice day !',
      color: const Color(0xFFE8E8EE),
      textStyle: chatStyle,
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
    await Future.delayed(
      Duration(
        milliseconds: messagesTexts.first.length * 180,
      ),
    );
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
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.grey.withOpacity(
          0.1,
        ), // Set the background color to transparent
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            blendMode: BlendMode.src,
            filter: ImageFilter.blur(
              sigmaX: 25,
              sigmaY: 25,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(
                  0.1,
                ), // Set the desired background color with opacity
                // Apply the blur effect
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        'GL',
                        style: chatStyle.copyWith(
                          color: Colors.white,
                          fontSize: 38,
                        ),
                      ),
                    ), // Set the desired background color with opacity
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'George Leonidis',
                    style: chatStyle.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
    );
  }
}
