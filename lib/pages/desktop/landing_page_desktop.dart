import 'dart:async';
import 'dart:ui';

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/profile_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LandingPage extends StatefulWidget {
  const LandingPage();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  bool isTyping = true;

  late List<Widget> messagesWidgets = [
    BubbleSpecialThree(
      text: "Hello there, I'm George.",
      color: imessageColor2,
      tail: false,
      isSender: false,
      textStyle: chatStyle,
    ),
    BubbleSpecialThree(
      text: 'Are you looking for a mobile developer ?\nI can help you out !',
      color: imessageColor2,
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
        color: imessageColor2,
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
        color: imessageColor2,
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
        color: imessageColor2,
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
      color: imessageColor2,
      textStyle: chatStyle,
      isSender: false,
    ),
  ];

  List<String> messagesTexts = [
    "Hello there, I'm George.",
    'Are you looking for a mobile developer ?\nI can help you out !',
    "Take a peak of my work.",
    'Or alternatively, send me an email.',
    'You can also reach me on LinkedIn.',
    'I am looking forward to hearing from you, have a nice day !',
  ];

  List<Widget> shownMessages = [];

  // Method to add a message to the list in periodic intervals

  Future<void> addMessage() async {
    const messageDelay = 125;
    kLog.f(
        'Delaying message for $messageDelay milliseconds and left ${messagesWidgets.length}');
    await Future.delayed(
      const Duration(
        milliseconds: messageDelay,
      ),
    );
    if (messagesWidgets.isNotEmpty) {
      shownMessages.add(messagesWidgets.removeAt(0));
      messagesTexts.removeAt(0);
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
    Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
      () {
        addMessage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Builder(
        builder: (cupertinoContext) {
          return Stack(
            children: [
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      if (shownMessages.isNotEmpty)
                        Column(
                          children: [
                            Center(
                              child: Text(
                                'Text message',
                                style: chatStyle.copyWith(
                                  color: Colors.grey[500],
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Today ${DateFormat('jm').format(DateTime.now())}',
                                style: chatStyle.copyWith(
                                  color: Colors.grey[500],
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ...shownMessages,
                      if (isTyping)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Stack(
                            children: [
                              BubbleSpecialThree(
                                text: '        ',
                                color: imessageColor2,
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
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 25,
                    sigmaY: 25,
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 130,
                    decoration: BoxDecoration(
                      color: imessageColor2.withOpacity(
                        0.65,
                      ), // Set the desired background color with opacity
                      // Apply the blur effect
                    ),
                    child: GestureDetector(
                      onTap: () {
                        CupertinoScaffold.showCupertinoModalBottomSheet(
                          context: cupertinoContext,
                          builder: (context) => Container(
                            color: imessageProfileDetailsBackgroundColor,
                            height: MediaQuery.of(context).size.height * 0.98,
                            child: const ProfileDetails(),
                          ),
                        );
                      },
                      child: const NameAvatar(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DetailsIcon extends StatelessWidget {
  const DetailsIcon({
    super.key,
    required this.icon,
    required this.text,
    this.isActive = false,
  });
  final IconData icon;
  final String text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: imessageColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 35,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isActive ? imessageColor : Colors.white.withOpacity(0.1),
              ),
              Text(
                text,
                style: chatStyle.copyWith(
                  color:
                      isActive ? imessageColor : Colors.white.withOpacity(0.1),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NameAvatar extends StatelessWidget {
  const NameAvatar({
    this.atProfileDetails = false,
    super.key,
  });
  final bool atProfileDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'George Leonidis',
              style: chatStyle.copyWith(
                color: Colors.white.withOpacity(0.8),
                fontSize: atProfileDetails ? 23 : 17,
                fontWeight:
                    atProfileDetails ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (!atProfileDetails) ...[
              const SizedBox(
                width: 5,
              ),
              const Icon(
                CupertinoIcons.chevron_right,
                color: Colors.grey,
                size: 10,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
