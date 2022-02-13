
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutIcon extends StatelessWidget {
  const LogoutIcon({required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              'Выйти',
              style: GoogleFonts.roboto(fontSize: 18.0, fontWeight:  FontWeight.bold),
            ),
            // icon-1
            IconButton(
                onPressed: onPressed, icon: Icon(Icons.logout_outlined,color: Colors.black,)),
          ]),
    );
  }
}
