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

    final List<List<Offset>> dots = [
      [
        Offset(size.width * 0.1, size.height),
        Offset(size.width * 0.15, size.height * 0.6),
      ],
      [
        Offset(size.width * 0.17, size.height * 0.5),
        Offset(size.width * 0.4, size.height * 0.4),
      ],
      [
        Offset(size.width * 0.5, size.height * 0.35),
        Offset(size.width * 0.6, size.height * 0.4),
      ],
      [
        Offset(size.width * 0.7, size.height * 0.38),
        Offset(size.width * 0.8, size.height * 0.2),
      ],
      [
        Offset(size.width * 0.9, size.height * 0.18),
        Offset(size.width * 0.91, size.height * 0.1),
      ],
    ];
    dots.forEach((dot) {
      path.quadraticBezierTo(
        dot[0].dx,
        dot[0].dy,
        dot[1].dx,
        dot[1].dy,
      );
    });

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
