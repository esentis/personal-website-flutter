import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/landing_page_desktop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    right: 15.0,
                  ),
                  child: Text(
                    'Done',
                    style: chatStyle.copyWith(
                      color: imessageColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const NameAvatar(
              atProfileDetails: true,
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsIcon(
                  icon: CupertinoIcons.phone_fill,
                  text: 'call',
                ),
                SizedBox(
                  width: 10,
                ),
                DetailsIcon(
                  icon: CupertinoIcons.videocam_fill,
                  text: 'video',
                ),
                SizedBox(
                  width: 10,
                ),
                DetailsIcon(
                  icon: CupertinoIcons.mail_solid,
                  text: 'mail',
                ),
                SizedBox(
                  width: 10,
                ),
                DetailsIcon(
                  icon: CupertinoIcons.info_circle_fill,
                  text: 'info',
                ),
              ],
            ),
          ],
        ),
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
    return Container(
      width: MediaQuery.sizeOf(context).width * .2,
      decoration: BoxDecoration(
        color: imessageColor2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 7,
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
                color: isActive ? imessageColor : Colors.white.withOpacity(0.1),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
