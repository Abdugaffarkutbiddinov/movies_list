import 'package:flutter/material.dart';

import 'sign_in_form.dart';


class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6657A1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
              child: SignInForm(
              ),
        ),
      ),
    );
  }
}
