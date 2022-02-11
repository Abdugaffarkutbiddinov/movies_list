import 'package:flutter/material.dart';
import 'package:movies/features/sign_in/presentation/widgets/custom_elevated_button.dart';


class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({required String text, required VoidCallback? onPressed})
      : super(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      color: Colors.blueGrey,
      height: 44,
      borderRadius: 4.0,
      onPressed: onPressed);
}
