import 'dart:async';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/profile_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen();

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with TickerProviderStateMixin {
  bool isTyping = true;
  final player = AudioPlayer();

  late List<Widget> messagesWidgets = [
    BubbleSpecialThree(
      text: 'Are you looking for a mobile developer ?\nI can help you out !',
      color: imessageColor2,
      tail: false,
      isSender: false,
      textStyle: cupertinoStyle,
    ),
    GestureDetector(
      onTap: () {
        launchLink('https://www.github.com/esentis');
      },
      child: BubbleSpecialThree(
        text: "Take a peak of my work.",
        color: imessageColor2,
        textStyle: cupertinoStyle.copyWith(
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
        textStyle: cupertinoStyle.copyWith(
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
        textStyle: cupertinoStyle.copyWith(
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
      textStyle: cupertinoStyle,
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

  List<Widget> shownMessages = [
    BubbleSpecialThree(
      text: "Hello there, I'm George.",
      color: imessageColor2,
      tail: false,
      isSender: false,
      textStyle: cupertinoStyle,
    ),
  ];

  // Method to add a message to the list in periodic intervals

  Future<void> addMessage() async {
    const messageDelay = 125;
    kLog.f(
      'Delaying message for $messageDelay milliseconds and left ${messagesWidgets.length}',
    );
    // await player.setSource(AssetSource('income.wav'));
// will immediately start playing
    await Future.delayed(
      const Duration(
        milliseconds: messageDelay,
      ),
    );
    if (messagesWidgets.isNotEmpty) {
      await player.play(
        DeviceFileSource('assets/income.wav'),
      );
      shownMessages.add(messagesWidgets.removeAt(0));
      messagesTexts.removeAt(0);
      if (mounted) {
        setState(() {
          if (messagesWidgets.isEmpty) {
            isTyping = false;
          }
        });
      }

      Timer(const Duration(seconds: 2), () {
        addMessage();
      });
    } else {
      if (mounted) {
        setState(() {
          isTyping = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        milliseconds: 2500,
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
                                style: cupertinoStyle.copyWith(
                                  color: Colors.grey[500],
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Today ${DateFormat('jm').format(DateTime.now())}',
                                style: cupertinoStyle.copyWith(
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

class NameAvatar extends StatelessWidget {
  const NameAvatar({
    this.atProfileDetails = false,
    this.showName = true,
    super.key,
  });
  final bool atProfileDetails;
  final bool showName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: showName ? 80 : 50,
              width: showName ? 80 : 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  'GL',
                  style: cupertinoStyle.copyWith(
                    color: Colors.white,
                    fontSize: showName ? 38 : 18,
                  ),
                ),
              ), // Set the desired background color with opacity
            ),
            const SizedBox(
              height: 5,
            ),
            if (showName)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'George Leonidis',
                    style: cupertinoStyle.copyWith(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: atProfileDetails ? 23 : 17,
                      fontWeight: atProfileDetails
                          ? FontWeight.bold
                          : FontWeight.normal,
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
        ),
        if (!showName)
          Positioned(
            bottom: 0,
            right: -5,
            child: SvgPicture.asset(
              'assets/message.svg',
              height: 25,
            ),
          ),
      ],
    );
  }
}
