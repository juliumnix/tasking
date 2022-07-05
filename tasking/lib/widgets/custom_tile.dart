import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTile extends StatefulWidget {
  final bool hasButton;
  final String title;
  final double hours;
  final String url;
  final bool? isComplete;
  final double verticalPadding;
  final double horizontalPadding;
  final Function onPressedActivate;
  final Function onPressedDesactivate;
  const CustomTile({
    Key? key,
    required this.hasButton,
    required this.title,
    required this.hours,
    required this.url,
    this.isComplete,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.onPressedActivate,
    required this.onPressedDesactivate,
  }) : super(key: key);

  @override
  State<CustomTile> createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding),
      child: Container(
        decoration: BoxDecoration(
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
          color: widget.isComplete != null
              ? widget.isComplete!
                  ? Colors.green
                  : Colors.red
              : Colors.white,
        ),
        height: ((MediaQuery.of(context).size.height) * 0.128),
        width: ((MediaQuery.of(context).size.width) * 0.833),
        child: Row(
          children: [
            Padding(
              padding:
                  EdgeInsets.all(((MediaQuery.of(context).size.width) * 0.027)),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    widget.url,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
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
                        "${widget.hours.toString().replaceAll(".", ":")} AM",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: GoogleFonts.comfortaa().fontFamily,
                            fontSize: 16),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: widget.hasButton
                            ? OutlinedButton(
                                style: ButtonStyle(
                                    backgroundColor: _isPressed
                                        ? MaterialStateProperty.all(
                                            const Color(0xFFEEF2F0))
                                        : MaterialStateProperty.all(
                                            const Color(0xFFFFFFAB))),
                                onPressed: () {
                                  if (_isPressed) {
                                    widget.onPressedDesactivate();
                                  } else {
                                    widget.onPressedActivate();
                                  }
                                  setState(() {
                                    _isPressed = !_isPressed;
                                  });
                                },
                                child: const Text(""),
                              )
                            : null,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
