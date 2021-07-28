import 'package:flutter/material.dart';

class LeftSideBox extends StatelessWidget {
  final child;
  const LeftSideBox({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 2.5,
      width: size.width / 1.5,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.horizontal(right: Radius.circular(64.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade100.withOpacity(0.9),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          )
        ],
      ),
      child: child,
    );
  }
}
