import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/features/sign_in/constants.dart';
import 'package:movies/features/sign_in/presentation/widgets/custom_elevated_button.dart';


class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({required String text, required VoidCallback? onPressed})
      : super(
      child: Text(
        text,
        style: GoogleFonts.roboto(color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.w400),
      ),
      color: CustomColors.buttonColor,
      height: 65,
      width: 260,
      borderRadius: 4.0,
      onPressed: onPressed);
}
