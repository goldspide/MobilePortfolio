import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu_Option extends StatelessWidget {
  final IconData  icon;
  final String title;
  const Menu_Option({super.key, required this.icon, required this.title, required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children:<Widget> [
            Icon(
              icon,
              color: Colors.cyan,
              size: 26,
            ),
            SizedBox(width: 10,),
            Text(title, style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.white),
              ),
          ],
          ),
    );
  }
}
