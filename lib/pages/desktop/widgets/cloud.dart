import 'package:flutter/material.dart';

class Cloud extends CustomPainter {
  Color color;
  Cloud({
    this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0676083, size.height * 0.5507143);
    path_0.quadraticBezierTo(size.width * 0.0850833, size.height * 0.5967143,
        size.width * 0.1038833, size.height * 0.5883143);
    path_0.lineTo(size.width * 0.1036417, size.height * 0.5889429);
    path_0.quadraticBezierTo(size.width * 0.1034583, size.height * 0.6873571,
        size.width * 0.1634417, size.height * 0.6562571);
    path_0.quadraticBezierTo(size.width * 0.1864583, size.height * 0.7259714,
        size.width * 0.2503333, size.height * 0.7495857);
    path_0.quadraticBezierTo(size.width * 0.2656167, size.height * 0.7504143,
        size.width * 0.2951500, size.height * 0.7343286);
    path_0.quadraticBezierTo(size.width * 0.3088917, size.height * 0.7182857,
        size.width * 0.3227667, size.height * 0.6953429);
    path_0.quadraticBezierTo(size.width * 0.3498417, size.height * 0.7410429,
        size.width * 0.3666667, size.height * 0.7509000);
    path_0.quadraticBezierTo(size.width * 0.3994083, size.height * 0.7530714,
        size.width * 0.4340333, size.height * 0.7369143);
    path_0.lineTo(size.width * 0.4698583, size.height * 0.7027143);
    path_0.lineTo(size.width * 0.4900000, size.height * 0.6671429);
    path_0.quadraticBezierTo(size.width * 0.5164917, size.height * 0.6737000,
        size.width * 0.5258083, size.height * 0.6603286);
    path_0.quadraticBezierTo(size.width * 0.5452000, size.height * 0.6371143,
        size.width * 0.5450833, size.height * 0.5933286);
    path_0.quadraticBezierTo(size.width * 0.5447917, size.height * 0.5671714,
        size.width * 0.5335917, size.height * 0.5463429);
    path_0.quadraticBezierTo(size.width * 0.5209917, size.height * 0.5268000,
        size.width * 0.5058333, size.height * 0.5200000);
    path_0.quadraticBezierTo(size.width * 0.5097417, size.height * 0.4895429,
        size.width * 0.5035417, size.height * 0.4673286);
    path_0.quadraticBezierTo(size.width * 0.4994083, size.height * 0.4451571,
        size.width * 0.4808333, size.height * 0.4253571);
    path_0.lineTo(size.width * 0.4561500, size.height * 0.4101857);
    path_0.quadraticBezierTo(size.width * 0.4677667, size.height * 0.3729857,
        size.width * 0.4645833, size.height * 0.3459000);
    path_0.quadraticBezierTo(size.width * 0.4620583, size.height * 0.3175714,
        size.width * 0.4509333, size.height * 0.2823714);
    path_0.lineTo(size.width * 0.4357750, size.height * 0.2484714);
    path_0.lineTo(size.width * 0.4097500, size.height * 0.2107286);
    path_0.lineTo(size.width * 0.3803833, size.height * 0.1874286);
    path_0.quadraticBezierTo(size.width * 0.3565417, size.height * 0.1744286,
        size.width * 0.3367167, size.height * 0.1768000);
    path_0.quadraticBezierTo(size.width * 0.3268167, size.height * 0.1783000,
        size.width * 0.3018083, size.height * 0.1881286);
    path_0.lineTo(size.width * 0.2633667, size.height * 0.2178714);
    path_0.quadraticBezierTo(size.width * 0.2457667, size.height * 0.2472000,
        size.width * 0.2374000, size.height * 0.2807143);
    path_0.quadraticBezierTo(size.width * 0.2293250, size.height * 0.3202143,
        size.width * 0.2367750, size.height * 0.3505429);
    path_0.lineTo(size.width * 0.2110417, size.height * 0.3382143);
    path_0.quadraticBezierTo(size.width * 0.1793167, size.height * 0.3300857,
        size.width * 0.1601083, size.height * 0.3534000);
    path_0.quadraticBezierTo(size.width * 0.1386917, size.height * 0.3735714,
        size.width * 0.1244333, size.height * 0.4094429);
    path_0.quadraticBezierTo(size.width * 0.1187333, size.height * 0.4525143,
        size.width * 0.1225083, size.height * 0.4694429);
    path_0.quadraticBezierTo(size.width * 0.1055417, size.height * 0.4640143,
        size.width * 0.0833583, size.height * 0.4918286);
    path_0.quadraticBezierTo(size.width * 0.0705250, size.height * 0.5107143,
        size.width * 0.0676083, size.height * 0.5507143);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CloudShadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0719667, size.height * 0.5516857);
    path_0.quadraticBezierTo(size.width * 0.0890417, size.height * 0.5967286,
        size.width * 0.1074167, size.height * 0.5884857);
    path_0.lineTo(size.width * 0.1072333, size.height * 0.5891000);
    path_0.quadraticBezierTo(size.width * 0.1070000, size.height * 0.6853857,
        size.width * 0.1657000, size.height * 0.6549286);
    path_0.quadraticBezierTo(size.width * 0.1882167, size.height * 0.7231571,
        size.width * 0.2507000, size.height * 0.7462429);
    path_0.quadraticBezierTo(size.width * 0.2656667, size.height * 0.7470714,
        size.width * 0.2945250, size.height * 0.7313143);
    path_0.quadraticBezierTo(size.width * 0.3080167, size.height * 0.7156286,
        size.width * 0.3216000, size.height * 0.6932000);
    path_0.quadraticBezierTo(size.width * 0.3480750, size.height * 0.7379000,
        size.width * 0.3645500, size.height * 0.7475000);
    path_0.quadraticBezierTo(size.width * 0.3965333, size.height * 0.7496571,
        size.width * 0.4304000, size.height * 0.7338429);
    path_0.lineTo(size.width * 0.4654750, size.height * 0.7004143);
    path_0.lineTo(size.width * 0.4851667, size.height * 0.6655857);
    path_0.quadraticBezierTo(size.width * 0.5111167, size.height * 0.6720571,
        size.width * 0.5202417, size.height * 0.6589286);
    path_0.quadraticBezierTo(size.width * 0.5391750, size.height * 0.6362429,
        size.width * 0.5390750, size.height * 0.5934143);
    path_0.quadraticBezierTo(size.width * 0.5388000, size.height * 0.5678000,
        size.width * 0.5278417, size.height * 0.5474429);
    path_0.quadraticBezierTo(size.width * 0.5155417, size.height * 0.5283143,
        size.width * 0.5006500, size.height * 0.5216714);
    path_0.quadraticBezierTo(size.width * 0.5045333, size.height * 0.4918714,
        size.width * 0.4984333, size.height * 0.4701286);
    path_0.quadraticBezierTo(size.width * 0.4944000, size.height * 0.4484571,
        size.width * 0.4762333, size.height * 0.4290143);
    path_0.lineTo(size.width * 0.4520917, size.height * 0.4142286);
    path_0.quadraticBezierTo(size.width * 0.4634500, size.height * 0.3778000,
        size.width * 0.4603250, size.height * 0.3513286);
    path_0.quadraticBezierTo(size.width * 0.4578500, size.height * 0.3235857,
        size.width * 0.4469667, size.height * 0.2891000);
    path_0.lineTo(size.width * 0.4321333, size.height * 0.2559714);
    path_0.lineTo(size.width * 0.4066917, size.height * 0.2189857);
    path_0.lineTo(size.width * 0.3779417, size.height * 0.1962571);
    path_0.quadraticBezierTo(size.width * 0.3546167, size.height * 0.1835571,
        size.width * 0.3352250, size.height * 0.1858286);
    path_0.quadraticBezierTo(size.width * 0.3255250, size.height * 0.1873143,
        size.width * 0.3010833, size.height * 0.1969286);
    path_0.lineTo(size.width * 0.2634500, size.height * 0.2261143);
    path_0.quadraticBezierTo(size.width * 0.2462417, size.height * 0.2547571,
        size.width * 0.2380250, size.height * 0.2875000);
    path_0.quadraticBezierTo(size.width * 0.2301583, size.height * 0.3261429,
        size.width * 0.2374333, size.height * 0.3558286);
    path_0.lineTo(size.width * 0.2122917, size.height * 0.3437429);
    path_0.quadraticBezierTo(size.width * 0.1812417, size.height * 0.3357571,
        size.width * 0.1624500, size.height * 0.3586857);
    path_0.quadraticBezierTo(size.width * 0.1414917, size.height * 0.3783714,
        size.width * 0.1275500, size.height * 0.4135143);
    path_0.quadraticBezierTo(size.width * 0.1219667, size.height * 0.4556143,
        size.width * 0.1256667, size.height * 0.4721571);
    path_0.quadraticBezierTo(size.width * 0.1090667, size.height * 0.4668571,
        size.width * 0.0873583, size.height * 0.4941000);
    path_0.quadraticBezierTo(size.width * 0.0748083, size.height * 0.5126000,
        size.width * 0.0719667, size.height * 0.5516857);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.0676083, size.height * 0.5507143);
    path_1.quadraticBezierTo(size.width * 0.0850833, size.height * 0.5967143,
        size.width * 0.1038833, size.height * 0.5883143);
    path_1.lineTo(size.width * 0.1036417, size.height * 0.5889429);
    path_1.quadraticBezierTo(size.width * 0.1034583, size.height * 0.6873571,
        size.width * 0.1634417, size.height * 0.6562571);
    path_1.quadraticBezierTo(size.width * 0.1864583, size.height * 0.7259714,
        size.width * 0.2503333, size.height * 0.7495857);
    path_1.quadraticBezierTo(size.width * 0.2656167, size.height * 0.7504143,
        size.width * 0.2951500, size.height * 0.7343286);
    path_1.quadraticBezierTo(size.width * 0.3088917, size.height * 0.7182857,
        size.width * 0.3227667, size.height * 0.6953429);
    path_1.quadraticBezierTo(size.width * 0.3498417, size.height * 0.7410429,
        size.width * 0.3666667, size.height * 0.7509000);
    path_1.quadraticBezierTo(size.width * 0.3994083, size.height * 0.7530714,
        size.width * 0.4340333, size.height * 0.7369143);
    path_1.lineTo(size.width * 0.4698583, size.height * 0.7027143);
    path_1.lineTo(size.width * 0.4900000, size.height * 0.6671429);
    path_1.quadraticBezierTo(size.width * 0.5164917, size.height * 0.6737000,
        size.width * 0.5258083, size.height * 0.6603286);
    path_1.quadraticBezierTo(size.width * 0.5452000, size.height * 0.6371143,
        size.width * 0.5450833, size.height * 0.5933286);
    path_1.quadraticBezierTo(size.width * 0.5447917, size.height * 0.5671714,
        size.width * 0.5335917, size.height * 0.5463429);
    path_1.quadraticBezierTo(size.width * 0.5209917, size.height * 0.5268000,
        size.width * 0.5058333, size.height * 0.5200000);
    path_1.quadraticBezierTo(size.width * 0.5097417, size.height * 0.4895429,
        size.width * 0.5035417, size.height * 0.4673286);
    path_1.quadraticBezierTo(size.width * 0.4994083, size.height * 0.4451571,
        size.width * 0.4808333, size.height * 0.4253571);
    path_1.lineTo(size.width * 0.4561500, size.height * 0.4101857);
    path_1.quadraticBezierTo(size.width * 0.4677667, size.height * 0.3729857,
        size.width * 0.4645833, size.height * 0.3459000);
    path_1.quadraticBezierTo(size.width * 0.4620583, size.height * 0.3175714,
        size.width * 0.4509333, size.height * 0.2823714);
    path_1.lineTo(size.width * 0.4357750, size.height * 0.2484714);
    path_1.lineTo(size.width * 0.4097500, size.height * 0.2107286);
    path_1.lineTo(size.width * 0.3803833, size.height * 0.1874286);
    path_1.quadraticBezierTo(size.width * 0.3565417, size.height * 0.1744286,
        size.width * 0.3367167, size.height * 0.1768000);
    path_1.quadraticBezierTo(size.width * 0.3268167, size.height * 0.1783000,
        size.width * 0.3018083, size.height * 0.1881286);
    path_1.lineTo(size.width * 0.2633667, size.height * 0.2178714);
    path_1.quadraticBezierTo(size.width * 0.2457667, size.height * 0.2472000,
        size.width * 0.2374000, size.height * 0.2807143);
    path_1.quadraticBezierTo(size.width * 0.2293250, size.height * 0.3202143,
        size.width * 0.2367750, size.height * 0.3505429);
    path_1.lineTo(size.width * 0.2110417, size.height * 0.3382143);
    path_1.quadraticBezierTo(size.width * 0.1793167, size.height * 0.3300857,
        size.width * 0.1601083, size.height * 0.3534000);
    path_1.quadraticBezierTo(size.width * 0.1386917, size.height * 0.3735714,
        size.width * 0.1244333, size.height * 0.4094429);
    path_1.quadraticBezierTo(size.width * 0.1187333, size.height * 0.4525143,
        size.width * 0.1225083, size.height * 0.4694429);
    path_1.quadraticBezierTo(size.width * 0.1055417, size.height * 0.4640143,
        size.width * 0.0833583, size.height * 0.4918286);
    path_1.quadraticBezierTo(size.width * 0.0705250, size.height * 0.5107143,
        size.width * 0.0676083, size.height * 0.5507143);
    path_1.close();

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
