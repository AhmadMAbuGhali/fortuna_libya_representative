import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class LangaugeScreen extends StatelessWidget {
  const LangaugeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('اختر لغة التطبيق',style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s24),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h,),
          Container(
              width: double.infinity,
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 16.w ),
              child: ElevatedButton(onPressed: (){
                RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.onBoarding);

              }, child: Text('اللغة العربية',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
          SizedBox(height: 24.h,),
          Container(
            width: double.infinity,
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w ),
            child: ElevatedButton(onPressed: (){
              RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.onBoarding);
            },style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.white,
                side:const BorderSide(color: Colors.black, width: 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r))), child: Text('English',
              style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16),)
            ),
          )
        ],
      ),
    );
  }
}
