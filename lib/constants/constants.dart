import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants{
  Constants._();

  static const String title = "Pokedex";

  static TextStyle getTitleTextStyle(){
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: _calculateFontSize(48)
    );
  }

  static TextStyle getPokemonTextStyle(){
    return TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(24)
    );
  }

  static TextStyle getPokemonInfoTextStyle(){
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: _calculateFontSize(20)
    );
  }

  static TextStyle getPokemonInfoTextStyle2(){
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: _calculateFontSize(12)
    );
  }

  static TextStyle getChipTextStyle(){
    return TextStyle(
        color: Colors.white,
        fontSize: _calculateFontSize(14)
    );
  }

  static _calculateFontSize(int size){
    if(ScreenUtil().orientation == Orientation.portrait){
      return size.sp;
    }else{
      return (size * 0.5).sp;
    }
  }
}