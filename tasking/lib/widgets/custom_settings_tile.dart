import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSettingsTile extends StatelessWidget {
  final String title;
  final bool isInteractive;
  final void Function() onClick;

  const CustomSettingsTile(
      {Key? key,
      required this.title,
      required this.isInteractive,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: MediaQuery.of(context).size.height * 0.067,
            width: MediaQuery.of(context).size.width * 0.833,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height * 0.01),
                bottom: (MediaQuery.of(context).size.height * 0.01)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 2, // changes position of shadow
                ),
              ],
            ),
            child: Center(
                child: isInteractive
                    ? ListTile(
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: GoogleFonts.comfortaa().fontFamily),
                        ),
                        onTap: () => onClick,
                        trailing: Icon(Icons.arrow_forward_ios),
                      )
                    : ListTile(
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: GoogleFonts.comfortaa().fontFamily),
                        ),
                      ))));
  }
}
