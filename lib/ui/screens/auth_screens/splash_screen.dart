
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () async {
      RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.language);
    });
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Image.asset(ImageAssets.logo,height: 332.h,width: 332.w,),
          )),
    );
  }
}
