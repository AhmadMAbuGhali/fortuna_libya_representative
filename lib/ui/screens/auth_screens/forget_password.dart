import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/navigator/router_class.dart';
import 'package:fortuna_libya_representative/navigator/routes_const.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/font_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';
import 'package:fortuna_libya_representative/services/auth_provider.dart';
import 'package:fortuna_libya_representative/ui/general_component/custom_text_form_filed.dart';

import 'package:provider/provider.dart';

import '../../../resources/assets_manager.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> logFormkey = GlobalKey<FormState>();

  ForgetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: logFormkey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 59.h),
                  SizedBox(
                    height: 155.h,
                    width: 155.w,
                    child: Image.asset(
                      ImageAssets.logo,
                      height: 332.h,
                      width: 332.w,
                    ),
                  ),
                  Text(
                    'إسترجاع كلمة المرور',
                    style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomTextFormFiled(
                      label: 'ينورتكلالا ديربلا',
                      hint: 'انه ينورتكلالا ديربلا ةباتكب مق',
                      controller: _emailController,
                      enable: true,
                    ),
                  ),


                  SizedBox(
                    height: 137.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton(onPressed: (){
                          RouterClass.routerClass.navigateTo(NavegatorConstant.otp);
                        }, child: Text('إرسال',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
                  ),

                ]),
          ),
        );
      }),
    );
  }
}
