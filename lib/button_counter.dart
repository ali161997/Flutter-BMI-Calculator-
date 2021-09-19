import 'package:flutter/material.dart';
import 'constants.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.onCount, required this.icon});
  final VoidCallback? onCount;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onCount,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
      ),
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(kBkg_active_card),
        shape: MaterialStateProperty.all(CircleBorder()),
      ),
    );
  }
}
