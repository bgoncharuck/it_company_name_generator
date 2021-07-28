import 'package:flutter/material.dart';
import 'dart:math';

class AppBackGround extends StatelessWidget {
  const AppBackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              ClipPath(
                clipper: const _WawyClipper(),
                child: Container(
                  height: screenHeight / 4,
                  color: Colors.orange.shade100,
                ),
              ),
              ClipPath(
                clipper: const _WawyClipper(),
                child: Container(
                  height: screenHeight / 4.5,
                  color: Colors.orange,
                ),
              ),
              ClipPath(
                clipper: const _WawyClipper(),
                child: Container(
                  height: screenHeight / 12,
                  color: Colors.deepOrange.shade400,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(pi),
            child: Stack(
              children: [
                ClipPath(
                  clipper: const _WawyClipper(),
                  child: Container(
                    height: screenHeight / 4,
                    color: Colors.lightBlue.shade100,
                  ),
                ),
                ClipPath(
                  clipper: const _WawyClipper(),
                  child: Container(
                    height: screenHeight / 4.5,
                    color: Colors.lightBlue,
                  ),
                ),
                ClipPath(
                  clipper: const _WawyClipper(),
                  child: Container(
                    height: screenHeight / 12,
                    color: Colors.blue.shade500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WawyClipper extends CustomClipper<Path> {
  const _WawyClipper();
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
    return false;
  }
}
