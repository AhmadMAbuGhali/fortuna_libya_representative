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
                      label: 'ينورتكلالا ديربلا',
                      hint: 'انه ينورتكلالا ديربلا ةباتكب مق',
                      controller: _userNameController,
                      enable: true,
                    ),
                  ),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomTextFormFiled(
                      label: 'رورملا ةملك',
                      hint: 'انه رورملا ةملك ةباتكب مق',
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
                        }, child: Text('لوخدلا ليجست',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),))),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: ' ؟ باسح كيدل سيل',
                            style: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14)),
                        TextSpan(
                          text: ' باسح ءاشنا',
                          style: getBoldStyle(color:ColorManager.primary,fontSize: FontSize.s14),
                          // recognizer:  TapGestureRecognizer()..onTap = () => RouterClass.routerClass.popFunction()


                        ),

                      ],
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 44.h,
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       if (logFormkey.currentState!.validate()) {
                  //         provider.changeIsLoading();
                  //         logFormkey.currentState!.save();
                  //         SentLogin sentLogin = SentLogin(
                  //             username: _userNameController.text,
                  //             password: _passwordController.text);
                  //         provider.login(sentLogin);
                  //         // Future.delayed(const Duration(seconds: 3), (){
                  //         //   provider.changeIsLoading();
                  //         // }
                  //         // );
                  //       }
                  //     },
                  //     child: provider.isLoading
                  //         ? Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text('تسجيل الدخول',
                  //                   style: getMediumStyle(
                  //                       color: ColorManager.white,
                  //                       fontSize: FontSize.s16.sp)),
                  //               const SizedBox(
                  //                 width: 10,
                  //               ),
                  //               const CircularProgressIndicator(
                  //                 color: Colors.white,
                  //               ),
                  //             ],
                  //           )
                  //         : Text(
                  //             'تسجيل الدخول',
                  //             style: getMediumStyle(
                  //                 color: ColorManager.white,
                  //                 fontSize: FontSize.s16.sp),
                  //           ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 39.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         width: MediaQuery.of(context).size.width,
                  //         height: 44.h,
                  //         margin: EdgeInsets.only(right: 5.w),
                  //         child: ElevatedButton(
                  //             onPressed: () {
                  //               // DioClient.dioClient.resetPassword('f','fdf','fdf');
                  //             },
                  //             style: ElevatedButton.styleFrom(
                  //               primary: ColorManager.tapBarColor,
                  //             ),
                  //             child: Text('زيارة الموقع ',
                  //                 style: getMediumStyle(
                  //                     color: ColorManager.black,
                  //                     fontSize: FontSize.s16.sp))),
                  //       ),
                  //       SvgPicture.asset(
                  //         IconAssets.siteVist,
                  //         width: 45,
                  //         height: 45,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ]),
          ),
        );
      }),
    );
  }
}
