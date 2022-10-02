import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/font_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';
import 'package:fortuna_libya_representative/ui/general_component/custom_text_form_filed.dart';

import 'package:provider/provider.dart';

import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';
import '../../../services/auth_provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> logFormkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    'انشاء حساب',
                    style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomTextFormFiled(
                      label: 'البريد الالكتروني',
                      hint: 'قم بكتابة البريد الالكتروني هنا',
                      controller: _userNameController,
                      enable: true,
                    ),
                  ),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomTextFormFiled(
                      label: 'كلمة المرور',
                      hint: 'قم بكتابة كلمة مرور',
                      controller: _passwordController,
                      enable: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                            checkColor: ColorManager.black,
                            activeColor: ColorManager.primary,
                            value: provider.isCheckLogin,
                            onChanged: (bool? value) {
                              provider.cahngeIscheckLogin();
                            },
                          ),
                        ),
                        Text('تذكرني',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s12.sp)), //Text
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            RouterClass.routerClass
                                .navigateTo(NavegatorConstant.forgetPassword);
                          },
                          child: Text(
                            'نسيت كلمة المرور؟',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s12.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton(onPressed: (){
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.homeApp);
                        }, child: Text('تسجيل الدخول',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: ' ليس لديك حساب؟',
                            style: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14)),
                        TextSpan(
                          text: 'انشاء حساب',
                          style: getBoldStyle(color:ColorManager.primary,fontSize: FontSize.s14),
                          // recognizer:  TapGestureRecognizer()..onTap = () => RouterClass.routerClass.popFunction()


                        ),

                      ],
                    ),
                  ),

                ]),
          ),
        );
      }),
    );
  }
}
