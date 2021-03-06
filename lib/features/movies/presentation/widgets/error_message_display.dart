import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessageDisplay extends StatelessWidget {
  final String message;

  ErrorMessageDisplay({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: 25,color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
