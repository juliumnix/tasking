import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final bool? isPassword;
  final String title;
  final Function(String value) setContent;
  const CustomInput(
      {Key? key,
      required this.hintText,
      this.isPassword,
      required this.title,
      required this.setContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.comfortaa(fontSize: 20, color: Colors.white)),
        Container(height: 5),
        TextField(
          onChanged: (value) {
            setContent(value);
          },
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(
              color: const Color(0xFFD4DBC6),
              fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            hintText: hintText,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
