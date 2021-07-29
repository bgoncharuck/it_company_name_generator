import 'package:flutter/material.dart';

class RightSideButtonIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  const RightSideButtonIcon({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        top: 8.0,
        bottom: 8.0,
      ),
      child: Icon(
        icon,
        color: color,
        size: 42.0,
      ),
    );
  }
}
