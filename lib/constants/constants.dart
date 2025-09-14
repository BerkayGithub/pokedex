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
        fontSize: _calculateFontSize(30)
    );
  }

  static TextStyle getChipTextStyle(){
    return TextStyle(
        color: Colors.white,
        fontSize: _calculateFontSize(20)
    );
  }

  static _calculateFontSize(int size){
    if(ScreenUtil().orientation == Orientation.portrait){
      return size.sp;
    }else{
      return (size*1.25).sp;
    }
  }
}