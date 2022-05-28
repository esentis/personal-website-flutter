import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esentispws/components/animated_logo.dart';
import 'package:esentispws/components/clock.dart';
import 'package:esentispws/constants.dart';
import 'package:esentispws/pages/desktop/contact.dart';
import 'package:esentispws/pages/desktop/portfolio.dart';
import 'package:esentispws/pages/page_builder.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({required this.deviceType});

  final DeviceType deviceType;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  double currentPage = 0;

  Animation<double>? size;

  bool isDrawerOpen = false;
  bool globalTapToDismiss = false;
  bool isLoading = true;

  double fontSize = 45;
  double copyRightFontSize = 20;

  double nameAngle = 0;
  double titleAngle = 0;

  double scale = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedLogo(
              deviceType: widget.deviceType,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height -
                (widget.deviceType == DeviceType.mobile ? 170 : 266),
            child: Scaffold(
              backgroundColor: kColorBackground,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 24.0,
                      bottom: 15,
                    ),
                    child: Clock(),
                  ),
                  Expanded(
                    child: PortfolioPage(
                      deviceType: widget.deviceType,
                    ),
                  ),
                  ContactInfo(
                    deviceType: widget.deviceType,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            color: kColorBackground,
            child: Center(
              child: Text(
                'esentis ©',
                style: kStyleDefault.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
