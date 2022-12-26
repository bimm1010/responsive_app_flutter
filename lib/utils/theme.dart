import 'package:flutter/material.dart';

const kColorPrimary = Color(
    0xff8E97FD); //không nên sử dụng các biến có sẵn trong flutter như ColorPrimary là sẽ lỗi

const kColorPrimaryYellow = Color(0xffFFECCC);
const kColorPrimaryGray = Color(0xffEBEAEC);
const kColorPrimaryText = Color(0xff3F414E);

class PrimaryFont {
  static String fontFamily =
      'HelveticaNeue'; //Viết ntn sẽ tăng dc 1 chút hiệu năng

  static TextStyle thin(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w100,
      fontSize: size,
    );
  }

  static TextStyle light(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size,
    );
  }

  static TextStyle medium(double size) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: size,
    );
  }
}
