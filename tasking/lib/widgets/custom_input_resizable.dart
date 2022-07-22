import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputResizable extends StatelessWidget {
  final String title;
  final String initialValue;
  final int lines;
  final int maxLength;
  final bool enabled;
  final Function(String value)? setContent;
  const CustomInputResizable(
      {Key? key,
      required this.maxLength,
      required this.lines,
      required this.title,
      required this.initialValue,
      required this.enabled,
      this.setContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.comfortaa(fontSize: 20, color: Colors.black)),
        Container(height: (MediaQuery.of(context).size.height) * 0.02),
        TextField(
          controller: TextEditingController(text: initialValue),
          onChanged: (value) {
            if (setContent != null) {
              setContent!(value);
            }
          },
          enabled: enabled,
          maxLength: maxLength,
          maxLines: lines,
          minLines: lines,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(
                ((MediaQuery.of(context).size.width) * 0.0194),
                ((MediaQuery.of(context).size.height) * 0.0134),
                ((MediaQuery.of(context).size.width) * 0.0194),
                ((MediaQuery.of(context).size.height) * 0.0134)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: GoogleFonts.comfortaa().fontFamily,
            ),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
