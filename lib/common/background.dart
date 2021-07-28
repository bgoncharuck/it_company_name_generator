import 'package:flutter/material.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: const AppBackGroundPainter(),
    );
  }
}

class AppBackGroundPainter extends CustomPainter {
  const AppBackGroundPainter();

  void paint(Canvas canvas, Size size) {
    final bottomTriangleStyle = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.fill;

    final bottomTrianglePath = Path();
    bottomTrianglePath.moveTo(0, size.height / 2);
    bottomTrianglePath.lineTo(size.width / 7, size.height);
    bottomTrianglePath.lineTo(size.width, size.height);
    bottomTrianglePath.close();

    canvas.drawPath(bottomTrianglePath, bottomTriangleStyle);

    final topTriangleStyle = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.fill;

    final topTrianglePath = Path();
    topTrianglePath.moveTo(size.width, 0);
    topTrianglePath.lineTo(size.width / 7, 0);
    topTrianglePath.lineTo(0, size.height / 2);
    topTrianglePath.close();

    canvas.drawPath(topTrianglePath, topTriangleStyle);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
