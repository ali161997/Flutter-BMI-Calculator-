import 'package:flutter/material.dart';

const textStyle = TextStyle(fontSize: 18, color: Colors.grey);
const sizedBobSize = 15.0;
const iconSize = 70.0;

class GenderCardContent extends StatelessWidget {
  GenderCardContent({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        const SizedBox(
          height: sizedBobSize,
        ),
        Text(label, style: textStyle)
      ],
    );
  }
}
