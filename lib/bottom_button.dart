import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onClick, @required this.title});

  final VoidCallback? onClick;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
        color: kBottomContainerColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
