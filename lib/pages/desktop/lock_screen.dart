import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/messages_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

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
              'assets/bg.webp',
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
              Padding(
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
                                          fontSize: 21,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Hello there, I'm George.",
                                        style: cupertinoStyle.copyWith(
                                          color: CupertinoColors.black,
                                          fontSize: 21,
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
                                  color: CupertinoColors.black.withOpacity(0.5),
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
            ],
          ),
        ],
      ),
    );
  }
}
