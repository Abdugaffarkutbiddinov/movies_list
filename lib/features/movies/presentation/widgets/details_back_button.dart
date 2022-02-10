import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddButtonDetails extends StatelessWidget {
  AddButtonDetails({required this.text, required this.onPressed, required this.backgroundColor, required this.textColor});

  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 259, height: 59),
      child: ElevatedButton(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.0,
                // fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(textColor),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    side: BorderSide(color: backgroundColor)))),
        onPressed: onPressed,
      ),
    );
  }
}
