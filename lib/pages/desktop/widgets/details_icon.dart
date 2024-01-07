import 'package:esentispws/constants.dart';
import 'package:flutter/material.dart';

class DetailsIcon extends StatelessWidget {
  const DetailsIcon({
    super.key,
    required this.icon,
    required this.text,
    this.isActive = false,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                style: cupertinoStyle.copyWith(
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
