import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPersonTile extends StatelessWidget {
  final String letter;
  final double width;
  final double height;
  final String hexCode;
  final double fontSize;

  const CustomPersonTile({
    Key? key,
    required this.letter,
    required this.width,
    required this.height,
    required this.hexCode,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              color: Color(int.parse("0x62$hexCode")),
              border:
                  Border.all(color: Color(int.parse("0xFF$hexCode")), width: 3),
              borderRadius: BorderRadius.circular(22.5),
            ),
            child: Center(
                child: Text(letter,
                    style: TextStyle(
                        color: Color(int.parse("0xFF$hexCode")),
                        fontSize: fontSize,
                        fontFamily: GoogleFonts.comfortaa().fontFamily)))));
  }
}
