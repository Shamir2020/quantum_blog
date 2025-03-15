import 'package:flutter/material.dart';

const colorWhite = Colors.white;
const colorBlack = Colors.black;
TextStyle TextHeading1(color){
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: 22,
    color: color,
    fontWeight: FontWeight.w800,
  );
}

TextStyle TextHeading2(color){
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    color: color,
    fontWeight: FontWeight.w700,
  );
}

TextStyle TextHeading3(color){
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: 18,
    color: color,
    fontWeight: FontWeight.w700,

  );
}
TextStyle TextHeading4(color){
  return TextStyle(
    color: color,
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
}
TextStyle TextHeading5(color){
  return TextStyle(
    color: color,
    fontFamily: 'Poppins',
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );
}
TextStyle SmallText(color){
  return TextStyle(
    color: color,
    fontFamily: 'Poppins',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}