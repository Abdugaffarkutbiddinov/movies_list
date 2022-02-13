
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutIcon extends StatelessWidget {
  const LogoutIcon({required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: InkWell(
        onTap: onPressed,
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Выйти',
                style: GoogleFonts.roboto(fontSize: 18.0, fontWeight:  FontWeight.bold),
              ),
             SizedBox(width: 5,),
             Icon(Icons.logout_outlined,color: Colors.black,),
            ]),
      ),
    );
  }
}
