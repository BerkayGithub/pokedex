import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class UIHelper{
  UIHelper._();

  static double getAppTitleWidgetHeight(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.12.sh : 0.15.sw;
  }

  static double getAppTitleImageWidth(){
    return ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw;
  }

  static EdgeInsets getDefaultPadding(){
    if(ScreenUtil().orientation == Orientation.portrait){
      return EdgeInsets.all(12.h);
    }else{
      return EdgeInsets.all(8.w);
    }
  }
}