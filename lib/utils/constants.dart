import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SizeConfig.dart';

const Color mainColor = Color(0xFF00212D);
const Color mainColorSub = Color(0xFF0D605C);
const Color secondaryColor = Color(0xFFFE9730);
const Color secondaryColor2 = Color(0xFFdfb126);
const Color textColor = Color(0xFF041F29);
const Color grayColor = Color(0xFFF8F8F8);


const LinearGradient mainGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF094842),
    Color(0xFF094842),
    Color(0xFF094842),
    Color(0xFF094842),
    Color(0xFF094842),
    Color(0x90094842),
  ],
);

Widget SolidButton({
  required String name, required page, required num size, required BuildContext context
}) => Container(
  child: RaisedButton(
    elevation: 0,
    onPressed: () async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => page));
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    padding: const EdgeInsets.all(0.0),
    child: Ink(
      decoration: const BoxDecoration(
        // gradient: mainGradient,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Container(
        constraints: const BoxConstraints(minWidth: 88.0, minHeight: 43.0), // min sizes for Material buttons
        alignment: Alignment.center,
        child: Text(
          name,
          style: GoogleFonts.montserrat(
            color:mainColor,
            fontSize: SizeConfig.safeBlockHorizontal! * size,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  ),
);



Widget Avatar({
  required String urlImage,
  required radius
}) =>
    Container(
      decoration: BoxDecoration(
          gradient: mainGradient,
          shape: BoxShape.circle
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
        ),
        margin: EdgeInsets.all(2),
        child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(urlImage)
        ),
      ),
    );

