import 'package:esentispws/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
