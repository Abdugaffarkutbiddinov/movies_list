import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddButtonDetails extends StatelessWidget {
  AddButtonDetails(
      {required this.text,
      required this.onPressed,
      required this.backgroundColor,
      required this.textColor});

  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 248, height: 42),
      child: ElevatedButton(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              text,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(textColor),
            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff242424)),
            ),
        onPressed: onPressed,
      ),
    );
  }
}
