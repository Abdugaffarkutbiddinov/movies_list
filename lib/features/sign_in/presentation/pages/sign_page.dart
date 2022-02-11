import 'package:flutter/material.dart';

import 'sign_in_form.dart';


class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Sign In'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
              child: SignInForm(
              )),
        ),
      ),
    );
  }
}
