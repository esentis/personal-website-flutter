import 'dart:async';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/messages_screen.dart';
import 'package:esentispws/pages/desktop/widgets/name_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {});
      });
    });
  }

  List<String> assets = [
    'assets/1.webp',
    'assets/2.webp',
    'assets/3.webp',
    'assets/4.webp',
    'assets/5.webp',
    'assets/6.webp',
    'assets/7.webp',
    'assets/8.webp',
    'assets/9.webp',
    'assets/10.webp',
    'assets/11.webp',
    'assets/12.webp',
    'assets/13.webp',
    'assets/14.webp',
    'assets/15.webp',
    'assets/16.webp',
    'assets/17.webp',
    'assets/18.webp',
    'assets/19.webp',
    'assets/20.webp',
    'assets/21.webp',
    'assets/22.webp',
    'assets/23.webp',
    'assets/24.webp',
  ];
  final random = Random();

  late final randomImageIndex = random.nextInt(24);
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Image.asset(
              assets[randomImageIndex],
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Icon(
                  CupertinoIcons.lock_fill,
                  color: CupertinoColors.white,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                DateFormat('HH:mm').format(
                  DateTime.now(),
                ),
                style: cupertinoStyle.copyWith(
                  color: CupertinoColors.white,
                  fontSize: 100,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Text(
                DateFormat('EEEE,  d MMMM yyyy').format(
                  DateTime.now(),
                ),
                style: cupertinoStyle.copyWith(
                  color: CupertinoColors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w100,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastEaseInToSlowEaseOut,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const MessagesScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18.0,
                          horizontal: 18.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const NameAvatar(
                                      showName: false,
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'George',
                                          style: cupertinoStyle.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: CupertinoColors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Hello there, I'm George.",
                                          style: cupertinoStyle.copyWith(
                                            color: CupertinoColors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  'now',
                                  style: cupertinoStyle.copyWith(
                                    color:
                                        CupertinoColors.black.withOpacity(0.5),
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
