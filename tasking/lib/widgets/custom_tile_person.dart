import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasking/widgets/custom_person_icon.dart';

class CustomTilePerson extends StatefulWidget {
  final String title;
  final String type;
  final String letter;
  final String hexCode;
  const CustomTilePerson(
      {Key? key,
      required this.title,
      required this.type,
      required this.letter,
      required this.hexCode})
      : super(key: key);

  @override
  State<CustomTilePerson> createState() => _CustomTilePersonState();
}

class _CustomTilePersonState extends State<CustomTilePerson> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular((MediaQuery.of(context).size.width) * 0.062),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2, // changes position of shadow
          ),
        ],
      ),
      height: ((MediaQuery.of(context).size.height) * 0.128),
      width: ((MediaQuery.of(context).size.width) * 0.833),
      child: Row(
        children: [
          Container(
            padding:
                EdgeInsets.all(((MediaQuery.of(context).size.width) * 0.027)),
            child: CustomPersonIcon(
                letter: widget.letter,
                width: ((MediaQuery.of(context).size.width) * 0.222),
                height: ((MediaQuery.of(context).size.width) * 0.222),
                hexCode: widget.hexCode,
                fontSize: 40),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: GoogleFonts.comfortaa().fontFamily),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                Row(
                  children: [
                    Text(
                      widget.type,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: GoogleFonts.comfortaa().fontFamily,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
