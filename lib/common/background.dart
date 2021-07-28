import 'package:flutter/material.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipPath(
          clipper: _TopClipper(),
          child: Container(
            height: screenHeight / 3,
            color: Colors.orange.shade100,
          ),
        ),
        ClipPath(
          clipper: _TopClipper(),
          child: Container(
            height: screenHeight / 3.5,
            color: Colors.orange,
          ),
        ),
        ClipPath(
          clipper: _TopClipper(),
          child: Container(
            height: screenHeight / 9,
            color: Colors.deepOrange.shade500,
          ),
        ),
      ],
    );
  }
}

class _TopClipper extends CustomClipper<Path> {
  const _TopClipper();
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.lineTo(0, size.height);

    final firstStart = Offset(size.width * 0.1, size.height);
    final firstEnd = Offset(size.width * 0.15, size.height * 0.6);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    final secondStart = Offset(size.width * 0.17, size.height * 0.5);
    final secondEnd = Offset(size.width * 0.4, size.height * 0.4);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    final thirdStart = Offset(size.width * 0.5, size.height * 0.35);
    final thirdEnd = Offset(size.width * 0.6, size.height * 0.4);
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    final fourthStart = Offset(size.width * 0.7, size.height * 0.38);
    final fourthEnd = Offset(size.width * 0.8, size.height * 0.2);
    path.quadraticBezierTo(
        fourthStart.dx, fourthStart.dy, fourthEnd.dx, fourthEnd.dy);

    final fifthStart = Offset(size.width * 0.9, size.height * 0.18);
    final fifthEnd = Offset(size.width * 0.91, size.height * 0.1);
    path.quadraticBezierTo(
        fifthStart.dx, fifthStart.dy, fifthEnd.dx, fifthEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _Bottom extends CustomClipper<Path> {
  const _Bottom();
  @override
  Path getClip(Size size) {
    final path = new Path();
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
