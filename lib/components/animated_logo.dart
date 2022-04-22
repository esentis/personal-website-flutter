import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/page_builder.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({
    required this.deviceType,
    Key? key,
  }) : super(key: key);
  final DeviceType deviceType;
  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool clicked = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() {
            clicked = !clicked;
          });
        },
        child: AnimatedContainer(
          height: widget.deviceType == DeviceType.mobile ? 100 : 200,
          width: 230,
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: kColorBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(clicked ? 0 : 80),
              bottomRight: Radius.circular(clicked ? 0 : 80),
              topRight: Radius.circular(clicked ? 80 : 0),
              bottomLeft: Radius.circular(clicked ? 80 : 0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: clicked
                    ? Colors.white.withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
                offset: const Offset(1, 1),
                spreadRadius: 1,
              ),
              BoxShadow(
                blurRadius: 1,
                color: clicked
                    ? Colors.black.withOpacity(0.3)
                    : Colors.white.withOpacity(0.3),
                offset: const Offset(-1, -1),
                spreadRadius: 1,
              )
            ],
          ),
          duration: const Duration(milliseconds: 450),
          child: Image.network(
            'https://i.imgur.com/Ev1tYGT.png',
          ),
        ),
      ),
    );
  }
}
