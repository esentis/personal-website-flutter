import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/widgets/details_icon.dart';
import 'package:esentispws/pages/desktop/widgets/name_avatar.dart';
import 'package:flutter/cupertino.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          title,
          style: cupertinoStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          content,
          style: cupertinoStyle.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            textStyle: cupertinoStyle.copyWith(
              color: imessageColor,
              fontWeight: FontWeight.bold,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: cupertinoStyle.copyWith(
                color: imessageColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                    style: cupertinoStyle.copyWith(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DetailsIcon(
                  icon: CupertinoIcons.phone_fill,
                  text: 'call',
                  onTap: () {
                    _showAlertDialog(
                      context,
                      title: 'Call',
                      content:
                          'This action is not supported yet.\nTry reaching through mentioned links.',
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                DetailsIcon(
                  icon: CupertinoIcons.videocam_fill,
                  text: 'video',
                  onTap: () {
                    _showAlertDialog(
                      context,
                      title: 'Video call',
                      content:
                          'This action is not supported yet.\nTry reaching through mentioned links.',
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                DetailsIcon(
                  icon: CupertinoIcons.mail_solid,
                  text: 'mail',
                  isActive: true,
                  onTap: () {
                    launchLink('mailto:esentakos@yahoo.gr');
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                DetailsIcon(
                  icon: CupertinoIcons.info_circle_fill,
                  text: 'info',
                  onTap: () {
                    _showAlertDialog(
                      context,
                      title: 'Info',
                      content:
                          'This action is not supported yet.\nTry reaching through mentioned links.',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
